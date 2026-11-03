Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDF6606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZnjAakdY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqfzrJVp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=; b=ZnjAakdYvoVC3n
	3vS4sWrVIYXA3ktgEXGEnfJZLU9PymoPkh0ZDmo0rXlWZgQ5cWINpTV+nyhDQK2aGSrMum37vfTnA
	HTVRa4LP5vha6eNSj9gZKi1elXO+JVefWG/wFYJQXVDwT1kdeNIBuwRFazDNOk5mEkD/G0pFapBzP
	iC93GO+pPjlLW3fuR0qDzbCgWK99JflEQdvtxafT/tFrx18c2gE5m4TYWq/dPyvrUmuhf9R8UfRHE
	yA7ITupQpl/oH4lnP4aPkBgBhKfpzuM0YGIVhUnq9+wPBd5vkHGnBU7AS19klhFtPWxZl3RkFeuBG
	q2eeJAQipyc7wBN97kJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98S-00000001Lqf-1jag;
	Tue, 03 Nov 2026 07:40:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98P-00000001Lmi-2LHh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:40:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2e831e86ebfso23373515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691645; x=1794296445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=;
        b=hqfzrJVph7tZBZ80vTdjtXHHBqHJtB8AuFIyXimijIr7gmsKzlJipawhG96cz6LJSw
         jt71/3ApaP6P4qjBwfY3UIKG4oeAdmMT1CARaTqhdkiKyGH0jT3JHhFDY9nCdjy1yGGe
         BkYj/5ZLYxDJlOuiuU/vc0ilsOIwsvAQ9s4fZysyo9byN7xAbEA8hXi2ShFOTr//yS0V
         +ls5eQbO1E6OiA+dtOohNBrOs59nSwL3jQVbvFSqyhpsRu6yelne1isH6o8K4DhwmShc
         JwPvsvzajbFTaf28l7VVo3+lMIKaMBYoOcNyIoMtqvKkzepa27hX43h6Uokz2IVO+ajx
         fP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691645; x=1794296445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=;
        b=Oxznn60Rg47MjYOPSEbehcCilun/TzhyIouPPTaQEAy6kw0fc+Ch4zkR+zFiz8sIJ4
         hOGvF882o3757cKqMxZoqPXGgDS4LA+I+4cpuZtXZIRjcnDoDmbpE+STarqOvEICX6s1
         lBAqIFnbjTNM36r9N8aDPCRfurNzBrh2GTgCsqmGe1RTXt+rzEVHrLkwRqSDfmiFWJww
         CKo30SOF1/XZumS7gQCn3l+DkD9LNvTwRLqronWV1eOelDNJTabAcgMHs2l4CEucQBBm
         12T7UcgvNTIp76cnxn2OODdwEkwy/nSE9Ijo4puWb32N/62mmA3VvYpZyKJB3kcdikcv
         WzCw==
X-Forwarded-Encrypted: i=1; AKwUvByOw0twNXc3560GAqeMvJkoOWrR4HKM8yfLJ7MYI0byRZ/Jzu8Z4D5gJ3Iw/PsWSfBKl9xKbTCDkUkGphPd/55V@lists.infradead.org
X-Gm-Message-State: APuU4Z93pO5nEU4bAVgnCuu5vyxlTKvZONK+rUeGCnSM30NQ1F+ynt3o
	SWUbwu5L81zbUiNtb4OHN22QEDCrzm4h7ZJ2uAwjdzRW/uVvcSbvRLvbHvtprg==
X-Gm-Gg: AYBFou3YIl+cu2jgfjDvu+KDG6sE5TIJ3mKzLcBUO+qSDRcJ6wJBpUKrdpieTBzxkPB
	hwidiUT25XweDzW+grEQOB6Dnf9sPZmPNQhoHRv2/qv3vjwFMuJCh7N6zh1pPjmYlCgOQw+pgXo
	BIrrBKvug0Nyphi7BvAHCIdqFYTfzkY9OswknM2dhVt4ohYOiNkN83rphmfh5fvNglzv9Nc6LEv
	mMeXw12Plx0poSUahOFAkHqy4TiF1guM89A59p2scn35n31UaLBKGAbSI+TQIZLAqYHMwBsDgrW
	pLQdW/+FUBzKxy9veBxq14alC4NCEjMahF6UADOFv5h4deWdQ6ldBEWmozgjGODjvfjmzy463ps
	3kfRf/4epaMuPMNoC5Z+eml+wjqInd4CQtlGci9Tv1P4uhHsmkiAqnLzllTz+jSgvvCJHAnm/9L
	bCfJ8+DL18Ve8Bm0bh3EghiUg8+6CXnHH1jd/4WunSjmt//TkTA5u744Tkep6jn0fDEixKKYd9J
	ZzjQFIZq2BY5upnm12qPt1umiuQz0cp3vMbbWOMXHsF7mvyPf28D23E0K4JQz0Wb/TIAdE1R0to
	voXXoWO2NIy8EyHKw412zqk1mx+fueDabBnq6gWobc4YuJHEf1OjKSYexNRy/yrjPzTiv0UWr6U
	Yr95qBQVunJECAR9I009pGGyAhjn8FOOrYSb/w/YNmklKmAwsDWmbIOI/b9etdfODV5/Aysr48n
	bxNXo=
X-Received: by 2002:a17:90a:e7cf:b0:3ac:9a54:e3ce with SMTP id 98e67ed59e1d1-3ae8986e718mr10689427a91.63.1793691644616;
        Mon, 02 Nov 2026 23:40:44 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:44 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:52 +1000
Subject: [PATCH v4 04/22] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-4-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6733;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=q6cZjCz9R++Ba7lkffXrC5JosZFNf04Vy9Rd1123Uys=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/usmxdxzhdZvNmS70e5/1RxxwvHDTkPndTUn2iz
 dTIEv8JHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKleEszw369Bo9xKgbn9AUfmUx9e8xcLJE4bb5K+/OLMi3PdO9y+azIyTPryTHz
 tkXnx6kdq9HTaPS9t+bA42k7a7+b+nyInzQ/1cgEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234045_763743_6E9F51A8 
X-CRM114-Status: GOOD (  18.69  )
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

From: Martin Povišer <povik+lin@cutebit.org>

Add a binding for the primary audio subsystem found on Apple Silicon
Macs. This binding integrates the codecs and SoC I2S peripheral
used for driving the headset jack and speaker arrays on all Apple
Silicon Macs. The internal microphones on this platform are
connected to a distinct coprocessor and are not part of this
"main" audio subsystem.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../devicetree/bindings/sound/apple,macaudio.yaml  | 195 +++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..7a97ce5bb7a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,195 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  The speakers and headphone jack on Apple Silicon Macs are part of an
+  integrated audio subsystem comprising of Apple's I2S peripheral (MCA) and a
+  series of codecs. The machines have a wide variety of topologies ranging
+  from a simple mono speaker in the desktops to complex stereo arrays with
+  dual-opposed woofers and tweeters all driven by their own mono amplifiers.
+  This arrangement can be expressed as a set of DAI links, where the MCA ports
+  each codec is connected to are represented by the CPU side of the link.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,j180-macaudio
+              - apple,j274-macaudio
+              - apple,j293-macaudio
+              - apple,j313-macaudio
+              - apple,j314-macaudio
+              - apple,j316-macaudio
+              - apple,j375-macaudio
+              - apple,j413-macaudio
+              - apple,j415-macaudio
+              - apple,j456-macaudio
+              - apple,j473-macaudio
+      - items:
+          - enum:
+              - apple,j493-macaudio
+          - const: apple,j293-macaudio
+      - items:
+          - enum:
+              - apple,j414-macaudio
+              - apple,j504-macaudio
+              - apple,j514-macaudio
+          - const: apple,j314-macaudio
+      - items:
+          - enum:
+              - apple,j416-macaudio
+              - apple,j516-macaudio
+          - const: apple,j316-macaudio
+      - items:
+          - enum:
+              - apple,j475-macaudio
+              - apple,j575-macaudio
+          - const: apple,j375-macaudio
+      - items:
+          - enum:
+              - apple,j613-macaudio
+          - const: apple,j413-macaudio
+      - items:
+          - enum:
+              - apple,j615-macaudio
+          - const: apple,j415-macaudio
+      - items:
+          - enum:
+              - apple,j457-macaudio
+          - const: apple,j456-macaudio
+      - items:
+          - enum:
+              - apple,j474-macaudio
+          - const: apple,j473-macaudio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  model:
+    description:
+      Model name for presentation to users
+    $ref: /schemas/types.yaml#/definitions/string
+
+patternProperties:
+  "^([a-z]+-)?dai-link$":
+    description: Node for each sound peripheral such as the speaker array,
+      headphones jack, or microphone.
+    type: object
+    $ref: tdm-slot.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      link-name:
+        description: Name for the peripheral
+        enum: [ Headphone Jack, Speaker, Speakers ]
+        $ref: /schemas/types.yaml#/definitions/string
+
+      codec:
+        type: object
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 8
+            description: |
+              DAI list with the CODEC-side DAIs connected to the above CPU-side
+              DAIs and involved in this sound peripheral.
+
+              The list is in left/right order if applicable. If there are more
+              than one CPU-side DAIs (there can be two), the CODECs must be
+              listed first those connected to the first CPU, then those
+              connected to the second.
+
+              In addition, on some machines with many speaker codecs, the CODECs
+              are listed in this fixed order:
+
+              Four speakers: Left Front, Left Rear, Right Front, Right Rear
+              Six speakers: Left Woofer 1, Left Tweeter, Left Woofer 2,
+                            Right Woofer 1, Right Tweeter, Right Woofer 2
+
+        required:
+          - sound-dai
+
+      cpu:
+        type: object
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+            description: |
+              DAI list with CPU-side I2S ports involved in this peripheral.
+
+        required:
+          - sound-dai
+
+    required:
+      - link-name
+      - codec
+      - cpu
+
+required:
+  - '#address-cells'
+  - '#size-cells'
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+      model = "MacBook Pro J416";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      headphone-dai-link {
+        link-name = "Headphone Jack";
+
+        codec {
+          sound-dai = <&jack_codec>;
+        };
+
+        cpu {
+          sound-dai = <&mca 2>;
+        };
+      };
+
+      speaker-dai-link {
+        link-name = "Speakers";
+
+        dai-tdm-idle-mode-0 = "zero";
+        dai-tdm-idle-mode-3 = "zero";
+        dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+        dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+        codec {
+          sound-dai = <&speaker_left_woof1>,
+                      <&speaker_left_tweet>,
+                      <&speaker_left_woof2>,
+                      <&speaker_right_woof1>,
+                      <&speaker_right_tweet>,
+                      <&speaker_right_woof2>;
+        };
+
+        cpu {
+          sound-dai = <&mca 0>, <&mca 1>;
+        };
+      };
+    };

-- 
2.56.0


