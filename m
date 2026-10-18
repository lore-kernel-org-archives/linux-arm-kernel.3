Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B8DCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=; b=zVdHE0M43yx85rVCDVXWTHxE02
	ZDCH6EaSd3Dc95PfhvZqXY6jhGkbJW3xBo0Tunbc3fqb3BZLYRZvUGT6SABgo4b4myJH2188WXbcb
	seLRFmXmfLTQnZhBDtGLR/70VDyzlK+8/7qEb2IdiZdmUOXdzz0EokO3Dw+6mchw3lFwne7AfdgIX
	hJ8gmtAcusbqfzX4qOsPOj79MCDh+a3mX4AEP3oUjrvK/vyhtT4okg8XxJQVw3PREFyqlczXrUod0
	Y1gGcQZs4H7RJEhAd/fhrvR7+HPVwLRCOteFuNCPse7LbxGbLfSyz0ApyseBw7FK2CRwFiPvQuBWZ
	4cfpKRkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrA-00000005ZWD-2a78;
	Sun, 18 Oct 2026 05:54:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJr1-00000005ZR9-0Rkx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:54:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e9cf928dc9so1512405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302882; x=1792907682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=;
        b=Fa7bHev3g6LDp5u9m7uJbBn7lFpmOvsKp9CWdcPdEXC1pV9TF9H9tgo+WgMRzpO4US
         T2CRtWtQ0NDfVTO5IhoLpJT1K84GSvE4ZihaV3+ONxoYdXFKRzsZ35JYq4iGbUQ1n2OK
         YzIVVMFrIZ+CnWl2OQGlU7ppy+SR5cfvlrOJw8nmfe9Qjlz2Wv1AilB9kXmDnU3IEQfO
         wywIchRPYhdFh7DUgxrDDBzntXkWk5zswSenjz0W7koywEO28JmAw4Yo5H+aQ25yHRiy
         Oe6zo1cBysfrgaydD6LLLTwZE9g3z4MHyuMAzxG0XE1SvKgmYAkGsCRoBNfMPh4AlgPq
         wNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302882; x=1792907682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=;
        b=i0QQ0W6asOcBF+WQ7Zuf2PgKVyEK2ayk62mLSfdvQrEslOBXrI87c0o9Mzk6xU4v9K
         NVvpOBsLJe2B0LOILPmi7NKMg1bfimEVYvoQGRd2jG0OwddKIqEtwQz4JRZ1kj5fgES0
         1q5lF5ShgRnJoI1J7NIhd4d6/NXAJgYstvRMSOOU4TubjWQWTEPu+IbkyO+yoPNWudAT
         MealMx18DQU3SEP5I/PCJUSaoUn5xAnXsnN7c7fBHOQLybbBXbm/XZsEHPu6ghDo9p/x
         xNuciG9AIDJLfxDHBVjlo0ARO2iitq1tzkcxuEpPK00G9gScsaGs5Vwv1+MbZ2KEhoI7
         IuJg==
X-Forwarded-Encrypted: i=1; AKwUvByciBqlXYU3r3giBUu4iW1K54eYiH6R+lAkk1AxZCKKg5Zo//S/ng7UcRDe+iTq1HEu1jqfEc/8uIztZ7J76YuB@lists.infradead.org
X-Gm-Message-State: AFq9FYJc6Z2S0931hwfJzKf0en02bMMvv4FCRVrvMqMOr5Bv0xCZMDzO
	kN26pw5hOdRCAYpTJTK88O0IgABG2cpuSzlpSeNsHC7XXx1+B2lDStri
X-Gm-Gg: AYBFou0sBqIVczbqGOhzsgSbDFnO6oUsyikhTOX03nVXPTycLOQjtsiikOMldw5kNNl
	Dzo+S+e4LbCuQEB3bc3Q1IhuQMReAPY1HBYpSgXSMGCSxEO9hS/y1aqIewqkUVyMlU2av4jU1JP
	E4uHuQuIi674DaOsiQplZwubpaJ6hscdx7OFqRE+yysRznGwMQSkqxNNboe8hv2dOqOblm12zka
	7n845lzipKzrDIHX71olPKfKIXxj1dHHbBYKLEZywt602K2V3rF3S5HmgF8ZlS38NnDEdJ3kfF2
	XMnZMgucZSGByqnE8D/4JNWfCT6wE//raCL5OefYshCsY+F0FYZPZAv3zvdL/RDmC1Oy5JHVxt7
	jj0/8z9tx2hKfyyCYhYVUm9eq8LsyJS877hHONZa7ikFx7HxwmBdzp24Yh+u9pytE4JkHrKCNSo
	M7B0IhQL4nuVZ6R59Y9ZUx2ik3MFEMddz5p7QlnjDw8SrtHLkc3Lki75XmzltaAHx1b4pc+DPES
	kKRMXL8pML6+TJmDl8pN0Mtiw2XM95ieSROTAm8RK/uF81Q8Hgsd4FlSyo+7DLkmghECvFZBO2v
	6Tz4CdXPQnc2hW1AeICMNQYJfFWGYzZjWf8pF9uWwZqsGA==
X-Received: by 2002:a17:90b:4a45:b0:3ac:b6eb:e0cf with SMTP id 98e67ed59e1d1-3acef5dcc94mr2797709a91.40.1792302882329;
        Sat, 17 Oct 2026 22:54:42 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:55 +1000
Subject: [PATCH v3 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-1-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vyIYXeTvpK7D1QV50HT+GFALOmTzN0QImSyZ/l8Csqw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rn9v1rM2RbwXkbirPLsz4fsNjM/kRQz5nGODOYKc
 ej5qWHaMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGpbf4b/fiY1H4ybv6Rw7+vrXbuf+8/0fd9/cvhsW23Edk9s36MfTAx/RXP0Cq1
 6awsZZE4+mdUmqcF7qnS9vuaD7RLe2eslDgmwAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225443_248621_721D3652 
X-CRM114-Status: GOOD (  10.55  )
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
 .../bindings/sound/cirrus,cs42l84.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..ca137aa57461 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
 maintainers:
   - Martin Povišer <povik+lin@cutebit.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description: |
   The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
   in personal computers sold by Apple. It was first seen in 2021 Macbook
@@ -32,6 +35,8 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix: true
+
 required:
   - compatible
   - reg

-- 
2.56.0


