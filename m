Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD9606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CRGKTu0s;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IXMzZ4gG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TwLGHXSVbX2rCSP/BPHeG6+sTlveNYHXen0aF4/nxh0=; b=CRGKTu0sKrMXy7
	mH0/8NVzfUQlrXGHetmWC5FgFXExMC8ARuz/E8NyL/ufaH4YAM5+BfuE4KBW2s0xnbP0recaE3jPs
	8cLfh/6b0cQxcjQZrkJoAgyGpbJzCK0iZpFYtUxhE5Yese8KVnJ/Ue8hEB0Yn1+1k5XDvO01t3n1i
	GTyeQNLJsxRX4f9cqT4RGJfBwaL+OgMRdEhTapyNQTqwW5XjHO/KUee0YtZdjLiVfQO4nR8ivRONU
	GZpXvtK0MlK6rWw09u6ojjDr+bNdfQfh2s3drPbtONu0fOCXfjmGow+NPzy7ormTfGKKSrbcMO4vx
	IY6MuJ5THTJuME3Jv94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzR0-0000000Evot-2vpt;
	Thu, 22 Oct 2026 20:30:47 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzQy-0000000Evo7-0VLI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:30:45 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-5eae12762c9so126750e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792701043; x=1793305843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TwLGHXSVbX2rCSP/BPHeG6+sTlveNYHXen0aF4/nxh0=;
        b=IXMzZ4gG+GNuq1v9YlWKNEPPIQyH5FbgXIwMdDi/tsyl/HpReC6Iy9yXmmuStYNNZS
         gFtnj10CGhVuKMebTIqJ6S9DflycRR8lNO3oRsq4FDFJ4bgDEZxLFaAUILKqpOAjB2HG
         bCcA0qiMHoRJn2XdFp7JJU9nutoWJH//1ZiKedYfUewBEgoVAExbvwAiDN1hlAK5JySl
         yBlNISp/Ap9Dt1GkSZkoLsZie6yJWlftqdb+IxPMw2S7cUZEmF7IeJD4GybpcfQX9inI
         2sPGvoOfmuU7E3s8L4HdFyrpLtj+pOB4dexJEMG2tHpvC6xcCQurYmyKZlRUs0L7MKC9
         jEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701043; x=1793305843;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TwLGHXSVbX2rCSP/BPHeG6+sTlveNYHXen0aF4/nxh0=;
        b=PX+ManQSrizFw3b7+vhACZUUHfkJloshAx/pAT6ycRxHjRH1UDF9eLjwr/5p2W1AYE
         FZ7LkglgRkUnLiePsAR8s0JosLruyBskkwsnzwWtBPSWurkOyznsSGH4/xScOE7FFvCg
         Cl0dQRo89rLU0Q/KN8uqk1Qc0WKJxfAqc1eNLeroLxw2JATgVgVELfC/nK9vKdkFlqgk
         8hbXstW3t6mrLit7vTYE7TP0qLVi5mW+cQSLbvyfzEf5RDYqAWBW8E+pP4uvpOGKO8lq
         uYXaT5qfuWUAbZkWku6dwMsxh1YcWL3LgUwUcHTG4b/+JeGFjRGL0lWpAqjK0JZx/xpb
         AR4w==
X-Forwarded-Encrypted: i=1; AKwUvBweRHG9b2OJS1DxeAv3VfbxsHQp3Q+LQo+m0rfd8xIx+HPmRYZWAvWsWm9JIoXJRwr5ziNNIvnRCVt1flGkCbrl@lists.infradead.org
X-Gm-Message-State: AFq9FYI0htdhTguNFuEHf55mYOmZscqcHzMYpOAbccItSm0jn6gHOpRN
	rMkuzqfOCYJ3go2BNcHj+kBX+wX6xVyoPlHWYlzg0DtjU3FiTMRZBQWu
X-Gm-Gg: AYBFou3R/TD910Oi8za8WSdH2PaMbVvqotqApg1s4OMGoy3YhCAlEI53qGrsxhuyxot
	yxuU2V21PVvDDCSoimKL9hm6qd1DlBWL8vdKtwSJMDe8JKPZW3Jxa04ycnF7JWIWte33dfz14JA
	ZWMzBAufWjgNXy1cmFcS7+KwXZRZ9ntmgdLuP7thk4pD2FRXsNS9lmL2MSMRuSR/NMUR6fJ98BS
	vdMcf1bsTW1ArCANR8N2thj+BeTE1eZlxc/4hrNrVqm0AcIDOwIM+D1XsQLyk1UiGY87lgvcFsu
	wp8F5lz97sLJtVsXzT6GalmzwlJIMS/xHifybni64WvrmfvoSsM+rsGytoTPNlqWiOP4AASENBH
	dhpW4+AnKY3B0QwqnbtKr6hHD2XH80g61/v8uwtFvNSi4RN+D8XTqjqHMIOrXAw1QvLHdd5Uej9
	PrbI1Td/AqInz5DLfeGYYl8fWtXJ4qTjUAU+uHWSaDmG8FWLbzUjqMNJHI+700zvTNgGWtO7sYB
	Zo3ed1R8g5qDlq5MJQw6HUIdKAMYCDYJ0OSyYth4LnvCJTtT8FqfP78L4P12rrMCgPblX4tGbal
	NkyvHhqLl5bp9eUoI87E
X-Received: by 2002:a05:6102:644a:b0:7c3:91f5:26f1 with SMTP id ada2fe7eead31-7ccc32f27c8mr227930137.6.1792701042480;
        Thu, 22 Oct 2026 13:30:42 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910184bc75sm371879241.12.2026.10.22.13.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:30:42 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: linux@armlinux.org.uk,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH v2] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 17:30:15 -0300
Message-ID: <20261022203016.75038-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4e2383f0-9791-4840-a4d9-93fbe51b7a40@acm.org>
References: <20261022183658.58090-1-breno3011alves@gmail.com> <20261022185224.60700-1-breno3011alves@gmail.com> <20261022185224.60700-2-breno3011alves@gmail.com> <4e2383f0-9791-4840-a4d9-93fbe51b7a40@acm.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_133044_286132_DD9B5E15 
X-CRM114-Status: GOOD (  10.30  )
X-Spam-Score: 1.2 (+)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bart,

Thanks for the review.

> Why eight readl() calls instead of a loop?

The eight readl() calls mirror the assembly's unrolled 16-byte body
(4x ldmia + 4x stmia over 16 bytes).  Collapsed into a loop in v3 —
the compiler unrolls it for the aligned case.

> Additionally, please use put_unaligned_be32() instead of open-coding
> it.  Is the code below equivalent to the loop above?

Almost, but not quite — two subtleties:

1. w0 is declared as u16, which truncates the readl() result.  It
   happens to work because the compose step only uses the low 16
   bits, but u32 is less surprising.  Fixed in v3.

2. put_unaligned_be32() would byte-swap relative to the original
   assembly.  The asm did a plain 32-bit store:

        and   r3, r3, lr          ; r3 = w0 & 0xffff
        orr   r3, r3, r4, lsl #16 ; r3 |= w1 << 16
        str   r3, [r1]            ; plain 32-bit store

   On little-endian ARM that writes [w0_lo, w0_hi, w1_lo, w1_hi],
   i.e. put_unaligned_le32() semantics.  put_unaligned_be32()
   writes [w1_hi, w1_lo, w0_hi, w0_lo] — reversed.
   acornscsi_data_read() feeds SCSI payload bytes verbatim into the
   upper layer, so that reversal would corrupt the transferred data.

   v3 uses put_unaligned_le32() / get_unaligned_le32() / le16().
   Note: <asm/unaligned.h> was removed in 6.12; the include is now
   <linux/unaligned.h>.

v3 follows as a reply to this message.  The 16-, 8- and 4-byte bodies
are now a single 4-byte loop per direction.

