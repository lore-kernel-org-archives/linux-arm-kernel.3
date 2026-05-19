Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D107CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CBYz/NrZc+Vq3hNBdRWZOxUhNWZcSq3yq7VxD6rnqac=; b=SoNGe8JKbOdFaWGd95lCqDK2QA
	UwQDne1jzu/H8fbtYoIQ7zmP36klcO4CYdqQGGTz1UYubHWmEoY4rme+zsDBvh4nQrWr8DU+ZIieH
	BQ/RBct5h51FweonR9cJcXmDgApjqXoBgrASv+olJW0Pl8GX3QGfWBznucRV1kmTgUb2CBx3nsvzy
	BZqC3UpThkeibUcj6zZxozppiHHHjCRXXP818Ww90dfZ/xdAH3gifDg1t5a2EyljonYOeXeKxdKwG
	V26rxl2Ap5M0KvMkXar5+tavibh+MjAtB2fGcW30ttvzwC3Qp9Epn+xv/c7CnlD0QDxevso9KDl34
	i3wEV5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGRw-00000000rR8-0Dex;
	Tue, 19 May 2026 09:09:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGRv-00000000rQj-06jQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 09:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CBYz/NrZc+Vq3hNBdRWZOxUhNWZcSq3yq7VxD6rnqac=; b=N3PFUJgqpNYLglQRoKg3xEtKOA
	sM2RTSMlh8c4VAXaxzgoq2bNEM2e5YUt+Kbp5zfmUHICPBky7sOKgXOYLZL9UeDmAIH5KjzZX3S3N
	LG9OnqzKdflcE/38hSgq2NRPRDUbU2w1Je6F+0hQ9PUx7eovRBxsWN13qSdmwLDr8WhL7zV2F0lgj
	sL9pz6oZwHqLAhuvcWW9bHdKY/DLX247oPgCAy6kBDev2G8aanIptg/N+UtUiGR45tllezrvzqmUF
	jC+ftCGDIjtv0vc/DUn45Yb9zFHKeARSQzs43afAYiAJrosgXUQToGnu1kePZ2G3/JPTMLqzPKPFP
	rEeYqnug==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGRr-0000000DeJX-3tlN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779181741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CBYz/NrZc+Vq3hNBdRWZOxUhNWZcSq3yq7VxD6rnqac=;
	b=gboZNcyJ2JUFCxlfg5sG3cBse+Jb7piFFWcjDFqSXIpQGiZT3k6uJYo4KNAdRNVjLezWMx
	qukSVIU4b283icbUZ4NOh+JGRJQ8FWYRC6X/QeHQv12mLQAUyLqEcoClOTbeyGGX6sZpkd
	JGZaOmIoOTMc3D/kTwyL3GuQxLVDB8o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779181749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CBYz/NrZc+Vq3hNBdRWZOxUhNWZcSq3yq7VxD6rnqac=;
	b=TLM5WULDb9l66tiUPxwGrlwkPpp7JCsQDyIQSXuELIwsGb/mvEsaOD2uFrzldNA5JVWmmB
	Ys1xTnIEg6JaZfVqZiqKtLa+eOb5YPuhWBrRZJIR/fjiBrRHsPti5IxEwQTgil5zW5D2Qh
	EWCL107P1P2oN67o0UEIRGugvWiSYUY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-dxjUsW37P1Gb2iLkDA619g-1; Tue, 19 May 2026 05:07:25 -0400
X-MC-Unique: dxjUsW37P1Gb2iLkDA619g-1
X-Mimecast-MFC-AGG-ID: dxjUsW37P1Gb2iLkDA619g_1779181644
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45e73a4f1dfso1969426f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 02:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181644; x=1779786444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBYz/NrZc+Vq3hNBdRWZOxUhNWZcSq3yq7VxD6rnqac=;
        b=r8dIhlhhlyuAZOqNkhxdZwdduvNpgHF4FSAUy3lOICI9Lv8oYjvp2lWgk+Zu8z1kcQ
         Qg6+QwlOTOKsFmDlHI3VPYBWBZ0NNr0tTASWSAk4ORFaLz2kcLJ4Xjmq5zrRoe/Df77/
         f/tRl6CRjgryrV1fbx53MrL4qTBLMXLBkIZE7k+PBbwb4bkAns+HRoVX3ND4zp+vAO+D
         SutZ7Qkpfi1CZYctdI2As1y1pouRqfAtJNX/JcPwOs0q6FS4bHLi3Q1dulrL6Z+ZXmQz
         vrFGX7bs7nIHP7YpMjBZI/LL+MPHkLWDeQ15aiarg7L6UuPAU+IWIno233KOFrO6IspW
         MSaw==
X-Forwarded-Encrypted: i=1; AFNElJ+cH/7EM7E7FVOK5EUwZrC1WkYUpr7S9+9Q555d45awFY19TT7vw3a6rjsHGZntgBtbfJ7kTRn23DwsQJoiYLpO@lists.infradead.org
X-Gm-Message-State: AOJu0Yze9mIUxRu7Xg/xjGBVpt75e7qxr88uHXlyhtvSMR0vWCMib/tD
	lW/MEhyX3bxz6crGVH49p7qKLcAVxoYHwfAHrrZRUVLBv5o6F0KMBQPyuvhIzpKTKGVtk3Q/wkb
	dkcGmIdnTHZcnW0elJi8AOA4nxPlwMYHGIbqRmBxOmwdmRqfcXZMBCfKfOjv+bxm4qJ9CorUPxd
	Tq
X-Gm-Gg: Acq92OFhUFOTAMIYQzqZeZMp2EaD+fxYeZueWh6pmGPSJAZ3iXeYUp8RfyxxF7S+BLS
	rTWKHV2lFKTiGUnpyBA0Gv9vJ0/Faa4gwPGFidXbha/VtjJoeSID/R2bec5JAUKExOqX9OxLwo1
	98l3eQEVto2OlN+f7Byvgkfa/9UD5uhvMIAh41F/Lb9cIryqPUNjZ4uGVuZW3+ZBk9KE4yE8KoB
	KSeFQ0GBC+XIzhuD/FU7Vua0USY0PiAS7XndRyTcoBY/X/ekmX1Tbvvq29g8OrZa95Bvo51Vmkh
	7ai9h3RleLRCIVoV6yWXLec5WTyUnPIVeIPP9HT/z8OUmOn92sFNJKefMPdaFUk0ygw3YO9LAnl
	DIznreXrr/fc1NDMKziENFpKbLqeqYcAgFyj7t+vXy+5gRtoHpMVu085YMvPZAZTcUcKPlss=
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr269970615e9.10.1779181644013;
        Tue, 19 May 2026 02:07:24 -0700 (PDT)
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr269970105e9.10.1779181643625;
        Tue, 19 May 2026 02:07:23 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm40747270f8f.11.2026.05.19.02.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:07:23 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: drop obsolete file entry in PXA2xx/PXA3xx SUPPORT
Date: Tue, 19 May 2026 11:07:20 +0200
Message-ID: <20260519090720.301782-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p2wuAPbSUyt7ZmzBo9d0mYmSkxSAvBiNB2jzrLxNLN8_1779181644
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_100912_449620_40CDE320 
X-CRM114-Status: GOOD (  14.66  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 42f67e1d1cba ("ASoC: pxa: integrate sound/arm/pxa2xx into
sound/soc/pxa2xx") moves all files matching sound/arm/pxa* into
sound/soc/pxa/. Hence, the file entry in referring to sound/arm/pxa* does
not match any file in the repository anymore. As the PXA2xx/PXA3xx SUPPORT
section already contains a file entry referring to sound/soc/pxa/, the
moved files are already matched by the existing file entries.

Simply drop the obsolete file entry in PXA2xx/PXA3xx SUPPORT.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f986eb688ae4..e541617ac448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21774,7 +21774,6 @@ F:	drivers/pinctrl/pxa/
 F:	drivers/spi/spi-pxa2xx*
 F:	drivers/usb/gadget/udc/pxa2*
 F:	include/sound/pxa2xx-lib.h
-F:	sound/arm/pxa*
 F:	sound/soc/pxa/
 
 QAT DRIVER
-- 
2.54.0


