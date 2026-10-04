Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECECCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqmOLIl36qQETjuB7PbP+3Wg/tYuEHw7Jvc1sfwFByk=; b=1oOu9wJv5PIs+dDOBsm/zX+6P4
	wBOurC3KGFGKybdq2DBSau1QtaCkixoFTH3Oytjx8VWCi0RkA9wECK6EnFWiEVrXXwIsVSuIB5Erm
	+W6e6NS0hHPBHLeIBim4bctNkVERlknB71qzQ4+qov56bV36bmgN/zOwkNvXYTArPSjUZmkxRUADd
	yzhHtRPh7sLiqEBn6El35CtTEYF4R9u9aqasXkdMT9XWqC29lCoZrgR4ylT/QU+jE0TwEA/4P7leS
	/aImy/UmlgmLabwj4qXhv+UoRm2whknPcF2PaDNli8KELdDpS61fX9fzAWH8/2949z/8cp+wdTB/d
	j+kAjQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLT-0000000ENSQ-3f0i;
	Sun, 04 Oct 2026 06:05:11 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLR-0000000ENQE-15tr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:10 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a6df9494e5so178896a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093908; x=1791698708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqmOLIl36qQETjuB7PbP+3Wg/tYuEHw7Jvc1sfwFByk=;
        b=dgecnP3ANhyNkZIIhxqoogbP8dFuhwyeMpQ4T7YpsNKQO/3saHE2fGhtXMiYg+jJws
         5ZT5gqTLlspcrSNQ6VfptdmmkPVTD3bdr90FVgqdCVDlGKnjVySyfNAt9nQzgUyUQG9s
         CsbpuIBkKlGyLHdFYFYUSqXL3bMit4xUYRj3ns+nRli7rZ8IcUFNrX6B2ofhTiVcx8ZJ
         KtN4QFNk/G4Ake2iagb7gdpcpjvsuYN+AH/Npxdx3eqjpEONS37apwWmuxtbsGtEPRSt
         YoQvENKjFyqb4ojynVQ7oOEMAfpVBR5imhMkYifbe23Kq8JA2I9E7nusVjgnonjRVv0b
         Q4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093909; x=1791698709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqmOLIl36qQETjuB7PbP+3Wg/tYuEHw7Jvc1sfwFByk=;
        b=0RtcC4fbvhy0+mQHalvKYXXXyO/OAoBnCWSPoJ2abHnz1a/MibJut0lIbqFIvhTDF6
         BamtzE4kq6BphOdnFlZ2oBsw6HTIAO0HiIR0UTx+nqaiCda1vrK1Po0a005TzHzZCYpq
         +CSzgx5oJun3PBePXuztK5/78MNyn0hLpV0h8BuU0QtF5ce1M0VRO+HTDO6gsSFxWNAh
         EyueDIlImF/UJ0a1olO3MUhSqSBpF9JLSd/JLDc+KhLStx9Z0kE4Ezn5QCjOjtqKhUZ9
         iMwHvF7taaAXNF5NLeGogNif5OEbxNqOJ1cJclh4MFsTad2YhP4Vn3WTC3K3WyGbQ8QW
         q3FQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/kOXWIuGBQ6ne/J1PYqbu8lRMcc6bOdFyilnMs/gJbnpUp1cX+ZFK9LWxng8U4uUs+GfoJkOQrKarENtyJETf@lists.infradead.org
X-Gm-Message-State: AFq9FYLiTcqzxjGJ3mBcD44A1Z9CXOZRl9BvRV8qJ7NW4FDMiNUVWRyr
	mCdzwfl9RnkWsZEODomHKhUm5385/dc+YbOLGfUdva2W0fsTw5EfZDuk
X-Gm-Gg: AYBFou1qznLLxjZWZJgQra+q++i3vVjZC6g1SK2VBSx8cpqn3bvLVgFYl3qdFSZn8k8
	qmYsTV/N+9cC36gaSUEi+twjVnHklWBtWwA8WUx//bP0vmfQofxCDwNjeBQTl8BWTd9jyaTl3DG
	PmEuvCIScIQEzXFd0rtuHExyAtF21/9pCTeDeQ+xrUZsgJ0oy/m3Ow5HGykx3Wjec6SJzIdya5w
	aTLd8P9QoGNKOB8vgu7DVZwHNqjfsVLicL+1MN5p4/rTkfKaC61x7L62m47cfSaCfDb+CeP02Jo
	SF9N7SkweJYhDE8DVM2SMGhCzvsViFKkJHNJiLdBCbORb1QmRDv6YaSNE1OnXWIEVucYWHkLsvq
	JTJxRzjrM2ikaTIa1ANnr0yAv1gfSbfu6veKQqVVgV2k+cAuC1dah9OGXn7wv0fHZ2PrRMs63V8
	5Sw5Vjm8J+UI7tgLOh+IAX2sPF4f1xO5iayRv6/BYv3TLpn0Hz1JmC4Q7DaS8XoygPiHKZegxWh
	siZDwVLGfddNUvP2jT1JphpRAV5wx0WIm+idEYrG6Rno8lh+s+mVcbjhhvgC67MlTuTdncxQmfN
	5vuonRtx+pUzrZWBtL+yvIo5yzAAgSAcWNx9uEBJ0nrhxQg=
X-Received: by 2002:a17:90a:1117:b0:3a6:e9bf:f244 with SMTP id 98e67ed59e1d1-3a6e9bff6c1mr2758728a91.1.1791093908591;
        Sat, 03 Oct 2026 23:05:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:31 +1000
Subject: [PATCH v2 04/21] ASoC: dt-bindings: cs42l42: Document
 sound-name-prefix property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-4-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Cx0fL2VvnwLsqHLvmS8INkeZRK4JUpqpc1FDp9KDOfU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+TMa63lNI19lscfXLmmJedDuMK8VtmvCllnZKIn9
 T9vunipYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUb7zL8U0p1EZI4bPTtEkvLYlWLwllT1wbqXbuteH7xl8+7ontLkxn+B5/2/bb
 vj4KDQUOSipjXKZlle7gEz9leeFF4cCXrY4eXTAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230509_325772_D9B526E4 
X-CRM114-Status: GOOD (  10.34  )
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

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index bc759eaadeca..035463be1456 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -29,6 +29,9 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix:
+    $ref: component-common.yaml#/properties/sound-name-prefix
+
   VP-supply:
     description:
       VP power supply.

-- 
2.55.0


