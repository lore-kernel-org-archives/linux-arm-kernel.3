Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F92B606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r5fJL/IM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DT7TUbq8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=; b=r5fJL/IMUOb3e0
	2+RQYmgqtWuOMq2t04hQ6pR6kQg04+dHIX40oYoDH6XHobahUyxqWlSSw1cOpjSXPPIhFUe7aKqM0
	mJBBVNaXr7sWX7tYxI38doSfcANhfCq8399b8ud7Q8VGjdgL9qn8+IrOtgwl2bMJuygA2bX6hbkXI
	AClO+glZDIrKAyt9CV+bmAGu2LAINFpwhCtLy7vxe7sULqKW603+J/RWkJnYGvO8awCxlCeUx4kZe
	DKiynOItpouPirvN5xRGCbmdUPNbO6/6EpFcWHHM7fvS3iNtLA757xQXkWIOn2K0unJB3NBzGIirT
	k8G0a5aa2R3n4zovl4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98J-00000001LgI-3asN;
	Tue, 03 Nov 2026 07:40:39 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO987-00000001LWd-3s6i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:40:38 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso1294539a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691627; x=1794296427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=DT7TUbq812wDbpsm5ZVcIZCeltOQuztKPegynw0L7Y0SJfJKgN5X9visz+TBTXvdNr
         ahJ3k6MNrcdwErXNAhpLIdyjpd3eP9JPNOZFnTb4gGOSfn9fqDiHqHywRTPz8zvPkjWp
         LQUVjqR/Anuape6W7cL/70F3A8x86UIvM4CE8LaBiGh6sed4JLmNA9TAoy/zy8EohiM/
         oPtRYihZhJPg/FndelFI4PrfUFxWph/3B7UJP1T/4wPQw9JoTCWGvF67NVHNrXVwQFDS
         8+POo5u+1QdMejkggwakl4ZsnaQ+0thC2vfwTf+WKJ2Qt6KvzMfIdWVeS+Mrup1rA++r
         d3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691627; x=1794296427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=xGDgiwL+UOcZf/DwDTiQwkZaw5KYP+2BW6Dod+yam3xRuQl8QKpTarOBhGR7PYzi3Y
         5gizKr4ou4NDRErKudgk5dEclrUFodWpWWcDvhRTOquvyCvf/4puoL6GEw/iXbykMqJG
         rcgM5XyVVzroVfNWbom380anXe0DD4g/8wctm9+HWNzsHZ9yaVT5dxuouCG1ysqENQxr
         RIAp5OMYcixrSMXuh24gGSLzD3czdn7aye5m4vnO5rw3VCvqrZUa8222kJ7AueruD5Gp
         rlAjHHsMA5NToBY+QY80QhQ/YXD1gNmTlzJKbt9mKsCcWtjTPCBe50ITckx0gcxdKEcj
         HD6A==
X-Forwarded-Encrypted: i=1; AKwUvBy2hlWFAxyNGFHp95QsjgJYjyUOl0IPCcTPe/jkfEm7XEBC7lmRZKm0f5gmDc5Fowh8LwY0nSHKZINSzdHvfZeO@lists.infradead.org
X-Gm-Message-State: APuU4Z/ilgkWeO6WQyfsNd0VXDawYrEbwGelmKME/9YXUpnmzbKP0TCV
	KHnyTaqwZMS/SvBsNCV/455FhD3oNwvrRrBmtWRG8QxC5qtRRQVROrcV
X-Gm-Gg: AYBFou2Fu13HDxd7nMJhv60x7FkTP4jIUvx/dYvAdKQSrm6KEaHP7AH5VpEcQ/CDSep
	3dv3Iw+tuZdKdvIDFFETejh+Pjt3Pzxu4kQEKeneGFe3qwFdfOcTTguSp7yRhrUpjxEE0Mu1yJm
	m3ao/I2EYFPvrGzQcXEoMfadX9Qr/y6yANuLUaDw4jUWbCDQjw8DqKHHRpy05S8L+fUtGY1eEG0
	qLsEb55xsueNjULaGadgRH9CvQLJPN80DClKuIp84G8QSOhx9ttmRXxgGzEvwDmVMW0MeaNoIpw
	mWH1uM7eORXPoK/6U+XTKA8fBcZTOnqW9eZBPTp+fiPcsCoA0adbxcALJsMJ9FOfIL2I3PMNfTb
	0LdcH9EFOo72AcPyCMrtDKRdasBumZ/6v+HoXln1TnUpxfp32/beQNBP54zrsie1FKb2NG7ftgm
	SHoBycSHm53l/SUT1KyC9+C0yKOvXqh1f5anc9ORfK+5Q5nbbyBze2ZEvzHuZDZAS5vUQ7k2vEa
	j+0hQdA3OB9+bS9CMjXapuah/p74t1qrLzRz30OR1fa8ZcBGK2RDSnvRx6PJ27x1ht52r8hE6+A
	tsVkYQCg2m2DTACPs1FJuW9r8Rlm8HIgFQO/Fi5Y5Det3xtJuqUszSd2WkwGn64OYZs9/exE66F
	1A9C0mfV0t53rRuczdHZNSbICzShwhrQgsfYe3p2rztYcwLLShgV2+iy+yzvGkHWTk4LaTax5SW
	DXO7Y=
X-Received: by 2002:a17:90b:35c6:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3ae89536bdbmr10927084a91.4.1793691627024;
        Mon, 02 Nov 2026 23:40:27 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:50 +1000
Subject: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced
 dai-common properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-2-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ryTg7qu92xHmjo1HEk78arPtD12ewJvnTCmnNMpKI2c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+GpzjrzeRvYWVum1gj5HNzyuvK1hVdiudFLu8N0
 n3S1ebdMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOoLSxgZrl/hNrrKf2TVhzo7z237FA8e3jH3Nf/qtR/St39hfNBQ0sHwV3TNTE5
 f7x852/mjXWfWXk/xiHl+5AhnQ2rTYwn9Iv0OLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234029_545008_99BA105D 
X-CRM114-Status: GOOD (  11.72  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Allow this by refrencing
dai-common.yaml and allowing its properties to be used.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..4ac0af34c464 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description:
   The CS42L42 is a low-power audio codec designed for portable applications.
   It provides a high-dynamic range, stereo DAC for audio playback and a mono
@@ -193,7 +196,7 @@ required:
   - VL-supply
   - VA-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0


