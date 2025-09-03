Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E9ACA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 23:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xP13CUGWmP4Epf7561SmRsYIMeFmCIW416h7MJfMP4=; b=tAiqSut4dB8kCFyWgC76XPE9+k
	4cwO9Y37bAfXVxiHunNULgsu5p4eXnwdeVUWCrDKacCmFCE7oSWSdOMVxDjqkDwyG4AoT4rdLkZ5h
	jbcPSZ84wI/lwBsGsOvHZl+3D6esarCdF3BceahMEu6rgzVbFKHMrPRjfp6WE/mvZODsDUaOS0/ts
	iCP2ATHTjo+5GYeVOL83vYKOvBhVw0QRQhZUpKMTey13E7VZgsmEV5DUCbcy90qRvdrM+KboFEtJz
	/k3tAl8kn07K7gmnKXTDU+JKONBgy1Lf6+FrTAAhHJYhGPWYZjyaOWE4m4IjiHJHkVAkOJT6a5pfs
	tcb9Sn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwbM-00000007s9n-1nFV;
	Wed, 03 Sep 2025 23:09:16 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utshv-00000007Ncn-2wPv;
	Wed, 03 Sep 2025 18:59:48 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b4c53892a56so132623a12.2;
        Wed, 03 Sep 2025 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925987; x=1757530787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xP13CUGWmP4Epf7561SmRsYIMeFmCIW416h7MJfMP4=;
        b=HFinBIKXBD0mCwu/+rGdqprgEZfIOtmTGrSY+KUy0S4t5SuVjkwMDqgZnTT+S0PLeA
         9Lvp5g6ZKpIAgEwH8eRDGM91qCEkqdkCFPlNLwREg3kOAi4UBk2163ejbpY8N3Wz2y65
         m8bKgatBd5NZewAekoFKPryHNNewHUrCZpIipatAHaqV+aIwIz3SLSGD8ls5dKUAbDMD
         Bueb0uB1a450quBTMZXgI/jPDxarJ+YgAsDKiVcbW+JmUIvPgBVQO9hv25Dq6Ju5CkIw
         3oqOlHZ56WDwu7zMJsQ6dY9A0rFg9SxVQCJcUGc2GKajqEfRpQ6/+JmDPyLAvKjGsZgs
         ecuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925987; x=1757530787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xP13CUGWmP4Epf7561SmRsYIMeFmCIW416h7MJfMP4=;
        b=cfbQw4myRB+qJWMoSzPLsMC4Wxhdmm4BMXu+eh26XP/gzoDP+CODN+itvh/3iiIkW6
         +mBoHT/X6fFBVkqZYuk3rsX9kziat9W2UGSXsJzCnIdkHtbTt1txxWFMBTVgPTEjjMnB
         ib3E/NFRre1kE95LbYfuQ5ICcx2S/ARDr4tLLShXTiO+v8pPxgtd0KbLBz+V7sVTB0A4
         2GvKnq0GlYlaFFRZZRGF7JeSol0vbB6P//szfMw/2398CwVKARLVuWHrbvQag+vn4DI7
         1CYykvpkQ3JlqxWE4AFclVlK6Rw+jTqSc+vBEILKoQ1pL/P60C7wt2UObc806M/trrLQ
         BR3w==
X-Forwarded-Encrypted: i=1; AJvYcCU/89lxGcP+e4ekDYTi9ERSwIviNN7cteUnwZOIAxKkQnGazJHKWwoYeqoCQp1yOWFAB/q9Hq+GYWMHbMA=@lists.infradead.org, AJvYcCX83roA9/M1OhIos6K3Ufe8/g/w4du1KagIawmWmMimtijnItNRHbU5Q39fdhKeNciwQ0DrmX254PCLKHUL47aC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3tQd9hPV4bHI5D/gfKNckQsbs70OgK+X2NDfUgIeREFDIF0vD
	g8x/EeUZOPDVPjRrah6Lje0HfT0vKvD5MuMrjsPJD4vVt/Wvc6FOw1JOUiYiMw==
X-Gm-Gg: ASbGncse6HYFNtBNnEh68mi44ivnKbylT/GulG/HZ01qf9xC0JEq6+MJD8IGrXvtUgN
	p/bkg63DmYE5r7FsNepR/83J3o3JIAm5iurmVLjnWrzvrhYgTnJ4+i2fEIP00Sk7PENd2uqIWU0
	PWYOw5VjjtGjZIOla1XuGGq6EIj4td6asIL2aKfMcgutVbTuN852I0dePa6YagLF3wyrDlZf4Q/
	oHH1N9Cr6YY/Y628Mv4/1iMS8uxymHJzvIq/De4fjoeAQ68smvxeJOM/f9utxvKclhgo730gcex
	mIvwpWISxfIyHrsKBL2Cw72S+unVsD8vpBGdfRbrh2Oe2bGSlXRceKjPyomObaRBmUy6X/KHDFD
	FG9y5y+F8qoHb6Tes8ZAs3jTEtLA7AyWkJKtZr7ns6KyTyrTyzoFsiWFan2Z1ex2I
X-Google-Smtp-Source: AGHT+IGWl2NVhEd4Mf3PXgbO9PNmoIZrvx3puV/+d96WnhVgMh+tacbQQZaHLdVwJGJAzq5ejH+5QQ==
X-Received: by 2002:a17:902:e5d0:b0:24b:1766:cc70 with SMTP id d9443c01a7336-24b1766d2d6mr89341175ad.39.1756925986861;
        Wed, 03 Sep 2025 11:59:46 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:46 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 7/7] virtio_balloon: Stop calling page_address() in free_pages()
Date: Wed,  3 Sep 2025 11:59:21 -0700
Message-ID: <20250903185921.1785167-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115947_739220_4E0B1336 
X-CRM114-Status: GOOD (  12.93  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

free_pages() should be used when we only have a virtual address. We
should call __free_pages() directly on our page instead.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 drivers/virtio/virtio_balloon.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index eae65136cdfb..7f3fd72678eb 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -488,8 +488,7 @@ static unsigned long return_free_pages_to_mm(struct virtio_balloon *vb,
 		page = balloon_page_pop(&vb->free_page_list);
 		if (!page)
 			break;
-		free_pages((unsigned long)page_address(page),
-			   VIRTIO_BALLOON_HINT_BLOCK_ORDER);
+		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
 	}
 	vb->num_free_page_blocks -= num_returned;
 	spin_unlock_irq(&vb->free_page_list_lock);
@@ -719,8 +718,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
 	if (vq->num_free > 1) {
 		err = virtqueue_add_inbuf(vq, &sg, 1, p, GFP_KERNEL);
 		if (unlikely(err)) {
-			free_pages((unsigned long)p,
-				   VIRTIO_BALLOON_HINT_BLOCK_ORDER);
+			__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
 			return err;
 		}
 		virtqueue_kick(vq);
@@ -733,7 +731,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
 		 * The vq has no available entry to add this page block, so
 		 * just free it.
 		 */
-		free_pages((unsigned long)p, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
+		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
 	}
 
 	return 0;
-- 
2.51.0


