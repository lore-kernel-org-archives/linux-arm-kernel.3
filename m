Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E1606D804
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nqdq5Lxx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y26ISBHI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RY/sXJR+//XYZDqNeUIB/EseqfgzZRdyY7oVg4AHbJk=; b=Nqdq5LxxqGseCK/fnH5ZwzZmM7
	2wgriK+oG2Tp4/lhp3Ky8l4BFHqms82VwmGVL62WBXNiDPBia9ytK+QoXydT/L7PWpkpkGgjckq54
	DF1p9jfXgZ/OPzPvQ+NfarM3UozHD5Qi+sEbkBK4Q3MVAunUV0SQL76+1aAKwgP0OZfVDd34Bi6s8
	j7W9faUhT3EBEjho382o5XliomrBYVqQa1WbpQDgy5lJExb2Io0hEfT7aMBE6yh8K+RmmekVefvX9
	ovF4TRYhHm6N/l5fp0uq5gQsMfqe6X6O1/Y5kd1whxRAfXriTBDPNf9lEakrFQ9wqoRva0o4wH/W0
	gVWHLZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO982-00000001LVv-1YHn;
	Tue, 03 Nov 2026 07:40:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO97r-00000001LTC-40Vi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:40:20 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ab41538192so3094954a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691610; x=1794296410; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RY/sXJR+//XYZDqNeUIB/EseqfgzZRdyY7oVg4AHbJk=;
        b=y26ISBHIVm7dARegKjoWhY+UzPJm/C3JUJZuCOvoQqv9PIXaBbfCYV8anQ5GdG/00x
         oEOhikB5iqOaVCZWJNncWwSTsUlMTBotV4QKQBhOyj5R5lOX8ndjCL5oV3o8Kyi0xBiD
         /9IJA14rt89+izG4dbzCtjoXvlvCf+509xSapfZ+ndZo1GUgMfmBC4ubnFlveftdMnD6
         GoSxAJtLgWbMhYJVa+ftPXegeUSc07DP6mLWcHLQO1PrORLnxme98a2J0KVZrt5intRr
         JdzXnmQeKi4xRsBB2bxXRHcTGWkl7fpN57Gd3oNbKxmBWaJhRiGClki2AKAidXvqLJQT
         emCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691610; x=1794296410;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RY/sXJR+//XYZDqNeUIB/EseqfgzZRdyY7oVg4AHbJk=;
        b=N0r0dn/6hJTeNQyiJYqV8Sym+niGpVn+E78JkMIhEcAz3rtQ6q/wM9vyHVMrRYQRU1
         hBH+e2sNqb3LhVT1sytQQaXQIAYmCXXa9HllRCsZD+j6koXpcxo+ug0NY7nNh27p/4vY
         QLFGj39NTkM9WIBR23sdzNX5n33jE/njBdWd48Ls09PK6fJYEMU1RBkdf37jGpo6Zi2A
         tZmB59BnpMTn0tdq+QHzL9WaYaChjxnnFbBleYVOLu53qxIeExGekoBCSVQlNghrA+G8
         nrZV9RDJ2DU/lyd9bKc70DOOD3cwEL0iguJ6Q0Q1K/YtxjYDZDZ3lNXFG1FxbkGhBb5z
         uU1g==
X-Forwarded-Encrypted: i=1; AKwUvBxyOS/FKwFUBHeMWqSz5wlq72UiwjT09kTjTkYnjpwUvg8d8919FxJOeDwRcXd4+aqJgYSsb9cDX5bwhHTrRgF0@lists.infradead.org
X-Gm-Message-State: APuU4Z/cSg9veBSsAVBxpGHgMbwMWj3VtmkERierDfj64vP014wuNmoB
	vZYdGf9AAOzwsmjVaO2u73HVmwar+I6lrCoCpXwccDmAl04+mSFJCnHN
X-Gm-Gg: AYBFou1br3ee/XsX14jxvLdilMYRJj+U31z9iL1lrYvnxAX/40VI4EgsSDRBF2goM2z
	35aYmHeKUb53ZOG5pFYzkzJ1SAuoLG4Pa+y2cCbMfC7Vvbf3+Jcz8kOIcW3tKGfdPO1OFqTq89E
	AGUuKLRyZ/THI3LUcrg62YcFrZQZCpgzz3MGpiCySrSVk/yGAt2tfNO1A3K7misZQb8mTP9XSwH
	K0sKQ9KFuIVbOeKtszH8+0h1scukInUHwOMGkXj3IPEz7jBDEm2EpTFQioGptWFwWZ8lfjBBTKn
	4Nigmq3fNmV3Tjtzq+ywxkA9GtfSZgnE0o5P3NATwzo5Y8502vdnpzO1CXCona0LiuS8yubItpi
	sc+zNDZHFbFYJhiUFfvYmgIolN4uBsE5M7TQLByR6xwlqYTRGp3qQWMCyWm7lvIwadi28jSrrsg
	9TRoqsHu/2u4dTmDU67cNNS4lB3ozkr37HkG1OPjiRGOhczipS0PT7VZgm8z2GsK5f5PW2YUo+x
	cR2TUe3suxFxx0a+jkyh07hDEU1m8yzBgjpFrnn3K/O4lXojHkwkfWqFRXzPs4qwcHede9Uz4Gi
	ARwZCbiw86yctxDjoCy5KT1WzipOCxmXcks9bgbqkIEvTKJziesj5to/v97ihI2s46f0b/EJPlD
	tjMeoNrTXwB+kRs2U4yVm6Ur3vlflyCq+PFHXf7I26u1EsZnmp2Joby5Y440gSRdIGDiByBqcDb
	Yrdho=
X-Received: by 2002:a17:90b:4cd0:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3ae8974b76dmr9984235a91.29.1793691609740;
        Mon, 02 Nov 2026 23:40:09 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:09 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v4 00/22] Add speaker and headset jack support for Apple
 Silicon Macs
Date: Tue, 03 Nov 2026 17:39:48 +1000
Message-Id: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13Nyw6CMBQE0F8hXVvTFw9d+R/GxaW9QI1QQ4FoC
 P9ui0aJy0nmzMzEY2/Rk2Mykx4n663rQlC7hOgGuhqpNSETwUTGDjylLWgYjXVUSs21qiRTBki
 o33us7GOdOl/e2Y/lFfUQfWw01g+uf65fE4+9z6xgv9mJU0ZzxbUWDHKF6aluwd722rUkzk7iC
 zljagNFhKXK0WRSplD8Q7mBvNhAGSCUpqry8GsQtnBZlhc4fx/SJAEAAA==
X-Change-ID: 20260915-macaudio-33c1c4f304da
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
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11310;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6g7QVojQmSRkyvrUrdmAVUMi6as1nE3Ga0sd7SW9+ZE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+09t28WuuO3Qo91/7y7c36ur8VBM8utk9aTVajvM/
 i7PbZjH0DGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqzl6Gf0bpGu/MXu65yBy5drbCOwGfdfOPKbB817p/R2CT/KfvH34xMix/fca
 t58X51o0VSjKeubxH5iV5SJgpPWjny+9qiCq5xAcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234012_080630_98B063A3 
X-CRM114-Status: GOOD (  24.50  )
X-Spam-Score: -1.8 (-)
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TRACKER_ID,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

This series adds the machine driver and related bindings for the
primary audio subsystem on Apple Silicon Macs. The macaudio
machine driver is based on an RFC sent many years ago
by Martin Povišer[1]. 

The driver uses the DPCM model to dynamically
glue a backend DAI (combination of MCA ports and codecs) to a
frontend PCM. While this theoretically allows us to route any
backend to any frontend, this is not used in practice; the "Primary"
frontend is always used for the headset codec and the "Secondary"
is always used for the speakers.

The audio subsystem on Apple Silicon Macs is rather complicated and
the speaker arrangement is highly variable; some machines have a
single mono woofer while others pull together multiple woofers
and tweeters into a single stereo pair. Every machine also includes
a headset jack, and some also have their own builtin microphones which
are handled by a separate coprocessor with its own driver.

Many functions which are handled by firmware on other platforms
must be handled by the kernel or by userspace. Most notably, speaker
protection is handled by speakersafetyd[2], a userspace daemon.
Speaker protection is handled in userspace due to the expensive
floating point calculations and amount of per-machine configuration
data required.

The machine driver facilitates this by exposing a capture
PCM from which the voltage and current across each speaker's voice
coil can be read. Given that there are absolutely no hardware or
firmware level failsafes preventing permanent damage to the fragile
speakers found on these machines, the driver also implements a
failsafe that will significantly attenuate and lock the gains
of every connected speaker unless speakersafetyd is running.

Version 2 of this series drops numerous fixes and semi-related
patches that are not strictly necessary for the machine driver
to function correctly. These will be resubmitted at a later date.

Adding the required Devicetree updates for M3 series devices would
have bloated this series to an unreasonable size as they are still
missing most prerequisite hardware nodes. They will be added in a
future series.

Regards,
James

[1] https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/
[2] https://github.com/AsahiLinux/speakersafetyd

---
Changes in v4:
- Allow additional properties from dai-common in CS42L42 and CS42L84
- Extend base tdm-slot.yaml idle mode props instead of defining bespoke ones
- Clean up macaudio binding formatting
- Give CS42L83 regulators unique node names
- Drop useless reg property from macaudio dai-link, replace with named
  nodes for headphone and speaker links
- Fix up snd_soc_set_enum_kctl declaration to match altered argument names
- Set TDM idle mode/mask for single-codec machines
- Put card and jack back on the heap; not having these around causes more
  problems than it solves
- Prevent headphones from routing to the secondary mux, and speakers from
  routing to the primary mux as the primary mux cannot drive the speakers
  anyway
- Avoid leaking OF node references on failed driver probes
- Replace platform_remove with devres release action to cancel enqueued work
- Use str_has_prefix for checking speaker link name
- Link to v3: https://patch.msgid.link/20261018-macaudio-v3-0-abdff7741dea@gmail.com

Changes in v3:
- Add TAS5770L compatible to TAS2770 driver to match binding
- Fix incorrect Right Tweeter prefix on J415
- Make reference to dai-common.yaml in cs42l{42,84} bindings for
  common properties
- Fix Devicetree binding formatting in macaudio binding
- Sort macaudio compatible list by fallback compatible
- Add references to fixed regulators for machines with CS42L83
- Fix iMac model compatibles (they are compatible with each other)
- Fix Mac Mini J474 name
- Rework kctl activate/deactivate to be a more pure wrapper of snd_ctl_activate_id
- Check for kctl->put before iterating in soc_set_enum_kctl
- Allocate structs on heap in soc_set_enum_kctl
- Rework snd_soc_set_enum_kctl to be neater
- Refactor snd_soc_set_enum_kctl to eliminate ret assignment
- Set evalue.id and info.id in soc_set_enum_kctl
- Guard against pointer arithmetic errors/null pointer deref in volume limiter
- Replace stored snd_soc_card with static struct
- Mark speaker BEs/FEs as nonatomic
- Link to v2: https://patch.msgid.link/20261004-macaudio-v2-0-7b47ed6335a8@gmail.com

Changes in v2:
- Drop patches that are only tangentially related (will be submitted
  later)
- Drop wildcard-matching API for kctls
- Relabel J473 sound model to Mac mini
- Align Devicetree changes with upstream bindings
- Relax Cirrus CS42L42 required properties to keep DT style checker happy
- Define missing properties in CS42L{42,84} bindings
- Fix mistyped DT properties
- Improve macaudio DT binding description
- Drop generic fallback compatible for apple,macaudio
- Drop now-redundant descriptions from other compatibles
- Constrain DAI link link-name property with an enum of valid values
- Drop MCA node from macaudio binding example
- Fix heading comment style in macaudio
- Drop obsolete module parameter
- Replace string functions with safer variants
- Replace dropped wildcard API with searching for full kctl name
- Rework idle props parsing to better surface errors/invalid Devicetree entries
- Add additional locking to backend setup
- Take controls_rwsem when safety functions are called from workqueues
- Replace all mutex{,un}lock calls with guard/scoped_guard
- Fix incorrect amp gain value for j37x config struct
- static const-ify all config structs
- Cancel control lock update workqueue on teardown
- Drop unused DAPM widget
- Fix commented-out safe volume calculations
- Drop speaker lock kcontrol ownership checks and related core API extension
- Link to v1: https://patch.msgid.link/20260920-macaudio-v1-0-741cc20a74e5@gmail.com

To: David Rhodes <david.rhodes@cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Martin Povišer <povik+lin@cutebit.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
James Calligeros (17):
      ASoC: dt-bindings: cs42l84: Allow referenced dai-common properties
      ASoC: dt-bindings: cs42l42: Allow referenced dai-common properties
      ASoC: dt-bindings: tdm-slot: Allow indexed TDM idle properties
      ASoC: tas2770: Add compatible for TAS5770L
      arm64: dts: apple: t8103-jxxx: Add regulators for CS42L83 power supply
      arm64: dts: apple: t8103-j274: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j313: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j293: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j45x: Add headset jack nodes
      arm64: dts: apple: t8112-j413: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j415: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j473: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j493: Add speaker/headset jack nodes
      arm64: dts: apple: t600x-j31x: Add speaker/headset jack nodes
      arm64: dts: apple: t600x-j375: Add speaker/headset jack nodes
      arm64: dts: apple: t602x-j41x: Add speaker/headset jack nodes
      arm64: dts: apple: t602x-j47x: Add speaker/headset jack nodes

Martin Povišer (5):
      ASoC: dt-bindings: Add binding for Apple Silicon Mac audio
      ASoC: ops: Introduce 'snd_soc_ctl_activate'
      ASoC: ops: Introduce 'soc_set_enum_kctl'
      ASoC: card: Let 'fixup_controls' return errors
      ASoC: apple: Add macaudio machine driver

 .../devicetree/bindings/sound/apple,macaudio.yaml  |  195 +++
 .../devicetree/bindings/sound/cirrus,cs42l42.yaml  |    5 +-
 .../devicetree/bindings/sound/cirrus,cs42l84.yaml  |    8 +-
 .../devicetree/bindings/sound/tdm-slot.yaml        |   34 +-
 arch/arm64/boot/dts/apple/t6000-j314s.dts          |    5 +
 arch/arm64/boot/dts/apple/t6000-j316s.dts          |    5 +
 arch/arm64/boot/dts/apple/t6001-j314c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6001-j316c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6001-j375c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6002-j375d.dts          |    5 +
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi     |  131 ++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi          |   61 +
 arch/arm64/boot/dts/apple/t6020-j414s.dts          |    5 +
 arch/arm64/boot/dts/apple/t6020-j416s.dts          |    5 +
 arch/arm64/boot/dts/apple/t6020-j474s.dts          |    5 +
 arch/arm64/boot/dts/apple/t6021-j414c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6021-j416c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6021-j475c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6022-j475d.dts          |    5 +
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   35 +
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi     |   10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts           |   70 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  114 ++
 arch/arm64/boot/dts/apple/t8103-j313.dts           |   85 +
 arch/arm64/boot/dts/apple/t8103-j456.dts           |   43 +
 arch/arm64/boot/dts/apple/t8103-j457.dts           |   43 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi          |   32 +
 arch/arm64/boot/dts/apple/t8112-j413.dts           |  104 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts           |  128 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts           |   58 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  104 ++
 include/sound/soc-card.h                           |    2 +-
 include/sound/soc.h                                |    6 +-
 sound/soc/apple/Kconfig                            |   18 +
 sound/soc/apple/Makefile                           |    4 +
 sound/soc/apple/macaudio.c                         | 1734 ++++++++++++++++++++
 sound/soc/codecs/tas2770.c                         |    1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |    4 +-
 sound/soc/soc-card.c                               |   12 +-
 sound/soc/soc-core.c                               |    5 +-
 sound/soc/soc-ops.c                                |   99 ++
 41 files changed, 3182 insertions(+), 28 deletions(-)
---
base-commit: f308b528e539c2a14dc7d59201cff45d89b00ab2
change-id: 20260915-macaudio-33c1c4f304da

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>


