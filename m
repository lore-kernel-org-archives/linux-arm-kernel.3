Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5050CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0GaLlObt46a8EJpPZb4z/i0Sg3qenVChJ2WAkd7GSp8=; b=aF8NkEPc38AEdnK29ZOFHUqSto
	Va3I90IBqmMkWbjb2dgtnJQ/CxNIO/tobCoQHf04hIVv8cYBk3IhMOf99Os5G9dt5L+siyPRrLrfL
	Kk7VaezI6Gxz7RC2McVwvqW9jhPpV1gzZrN2HQZuz1Sfa2av30A0vlwgc4Fxgh0TRaLMMSQ3UCbj6
	tbZDdP783iWxLrmu6soK49BO+hWzHsPPaMgZE4zUzjZW+JrHYJk+OKG0d6sCwy02PNYP2PK/foJX5
	pkDMJ6HW548cm362z95aeWQxFlA4rfExS8y8Fx6RXh2JUKD6FBZIdJiUw/b3B9gVog8nQspCxdvFH
	XURM20kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpfm-0000000ElAe-04VA;
	Thu, 06 Nov 2025 02:24:26 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpfk-0000000El9w-28fj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:24:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29516a36affso4599875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 18:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762395864; x=1763000664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0GaLlObt46a8EJpPZb4z/i0Sg3qenVChJ2WAkd7GSp8=;
        b=KOWUp6qG+PxSD5+IzNAnegiMG4QjxcRditXOjZ8D1gvF4cW3fHQHB8gg5PkOrezvN9
         xGLQVXu/xPAUwcakG4kf2Edn18N5u5IzBDARrim7mHjcYZjxKli9qWTFsPNIaBLj3H9C
         sFFUiip/ry51L3o5UsfWGQ6dZvxsy5MbgQRKuAqAC5hy7pI+doBGgJ3mBKHveqMmbPNL
         kFfxrl6pdbVi3BxarS9aGkbT973cLOvjvot9QPsW0oaRvR4kve4GahgF1JmBUaltEXLc
         A0XmlUBnfAD2Qmp03lADagz7p+Gg/Q/XX9sxAroXdO2MfeHSdEnhW74wwWBOofMe3sQk
         oGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762395864; x=1763000664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GaLlObt46a8EJpPZb4z/i0Sg3qenVChJ2WAkd7GSp8=;
        b=dWZZzuapNf7YUGY5wClJPstkNjPglucdORlUTacQtyrmV4CGxMBTHhthv96XFUZ18I
         b4ZVX1HxUswG4erWmaRVrvLSGgTiBF31pk/G3oceUjqi+W6Rr6ehZHrNEQx7k1NhmPQG
         ac88Y5psYDbrwat6sgwdO04nUu+HuLtp6kq13VP2DP4bm8sJ6d8m47t6/J0ujwl3fo9o
         AUYgc77kglrGh67AAIPUnv81hjKGBcJthLaHf6Rx+6QISytobvPXHk/PKntjUBvDYtmS
         IjoQAQWVTiAOfpmqize/WLIrsG6Xm/gKgHU8aKjWA+CjQc8FFlYnDvTg8GM+t51maKBi
         ZOXw==
X-Forwarded-Encrypted: i=1; AJvYcCUSoVdX6eBLMSQlnkB+doBziv8ITHDBYoDJHeJmQTkgdxvHNc+5oA54YRMJLhLdRkMsAQc2rCiOeTvUUgygfz2h@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+n3J8/fkMahROLyvmINUZ3wFN54SbShFIyQrAWDRZO007T6NN
	c70EqBLAP7rfL+RQ90WuJn9Ldzd7EpRe7EdkkG1aA4/ITz+2a8SyKaxL
X-Gm-Gg: ASbGncs5RWc9epyrV/E0jeHTvPLdVaKRJeowwDqzmS8uQuoBqHXUaGVnUwEScAygkE5
	WZaIEjTh9a12o2vUtkT5s4XrlbLmL5ANkwpFalVRGt8OSIvvPMf7AucObzNU/Rp+9CYqAVPZhpk
	vD0uG65TheZyNhKPYKYifqdtVsCvUxySVfQAa0/yPIpZtKPlIpxcxEk89CK3jqkOlrdvNB6NFo1
	utfD6T+uqe/omsuROtehOub11+Mvj4P6jfIFtuUGU61NbthUnXn6nCh/7uPMqWZCVKdM0+iHhw9
	zBV7emeTdXxoWqqHgiJ582h1Maz6FzmChkgGAVl5gp023aUeIAyiPnygsr0TP6b+YTIvvcoo8OP
	Z4/iFs+tnBx4UhKsCVBGlV2WuOqgUQ3B5bGC5p2It5k7nAUE6ZjNsFgkNRQ==
X-Google-Smtp-Source: AGHT+IErrz9agjCHsj6Y7R7pkGgYn92tuq2BTiQ/UIRvnUTq70BO/rMnUcWv2UD6iPMrYeceNuar9w==
X-Received: by 2002:a17:903:1ce:b0:292:dca8:c140 with SMTP id d9443c01a7336-2962adb9205mr76924825ad.44.1762395863655;
        Wed, 05 Nov 2025 18:24:23 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5fdb5sm9399935ad.44.2025.11.05.18.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 18:24:23 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS)
Subject: [PATCH dmaengine 0/2] dmaengine: at_hdmac: support COMPILE_TEST
Date: Wed,  5 Nov 2025 18:24:03 -0800
Message-ID: <20251106022405.85604-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_182424_551597_CF0A0C17 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

First commit fixes compilation under 64-bit and second actually enables
it.

Rosen Penev (2):
  dmaengine: at_hdmac: fix formats under 64-bit
  dmaengine: at_hdmac: add COMPILE_TEST support

 drivers/dma/Kconfig    | 2 +-
 drivers/dma/at_hdmac.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

--
2.51.2


