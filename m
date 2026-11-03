Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9883606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CugkCW8A;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4ydUIlF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=; b=CugkCW8AnanYbFQRfuWmKr5ha+
	p97ljni2+m9apcjv2GQ5puNYrwm6t4FeDexONZzrpU+dazgdtdah8ANimsfMkPYvhMk8gS9cYHyiJ
	gHj40lwSOM2TYWUflQf6Y7E6p0YYPivOb46qLQNsR5R7ObJ0GeNYtyKts9jdPCwiVq5/m5SdKrGCT
	VVMqcgpvnqM5sB41CQPn/OEnlm+P9/Cyo69WvM/rPoqHZBU63yNpA2oWFS+ue9yW5dUBtmemP/p+j
	GPOldOZhdNrvL8CuOpOk+TG1cwB+sqnwiU1OwypMl62dsDW72HepaH4o7vD7aV2hDqw5YY+bGvQe5
	WpEk+VNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEjl-00000002arx-3biw;
	Tue, 03 Nov 2026 13:39:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEjj-00000002arI-01k9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:39:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so26066945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713177; x=1794317977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
        b=I4ydUIlFv6Kk711pyh4Kc0QFSZGilWT+Fj9NOa09wnlCpEGsM0gjauGwfSfHq+IlS+
         Aiw22Crw54bo5vHVEXCxjn8JrNdc4U1goMZ4PqNpg9+Qshel4zcColzYFA+aK3QwWNcD
         e76JyPdGI8f5IMdC+TevgemXZG/JwDQpje3N6NacqQAUAHp/YC7EgIQ70ZSUnuvo9wSv
         nq3HGV3/gyDiR4iaMIPe36IFGV9ygxk6ObM4D85V3o7p4faVSqnKmamkOQWJsCMT6YOF
         O6b69CytPGs8PUORHNjMP8gkXIGD2SbTXM5oHgzkZH7OJfEz1Z46iQJAPIqlpmQI8Syz
         XdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713177; x=1794317977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
        b=cfVT72WUp1UsRcQ/fTLU8fV6/1/b7WseEb8m8FuzeV0/YAF9zxgnyBvZW483MxSqKN
         Z90XKLrxB4tOi3X5rElBwbLxDXu5UHsLeCJoQ9LImdG1a6e474nl/NzuKHQhxOJFvH+u
         eUkpdAvR33UoRaTT34ePSOJAxUiLqq4c+ZcmW2wV0uy22Z79OnYhj2qA3MKhWsDBH5v4
         s3QRBgpLCWRszBtBaNfKoLY2XxU3QIAZFRSjsWt6bEjy16A83bl6umh1JwDP0DlT7jz4
         PKpqI8vbqbjweVQVB7ff+VkCSNGzG7F7IxxZjaGTblf2b6FD5zWRyC6pbNPxrSuugNs/
         mWTA==
X-Forwarded-Encrypted: i=1; AKwUvByUre65L9XdtvgVHSdWjl4DJHxo3/3RWg/JaWyIg2THhZeC/0SC9RZA25gCRW9l04oZ8WJ11DB3F7eoTGUs2y2G@lists.infradead.org
X-Gm-Message-State: APuU4Z/EIDckO9XrZfJE7AFzUxtap1UsWqLmuzNE0rqXXDmM7/GmTaAA
	zdyII5I0yfa1EW6HbDQ22v6NFxC2sfFILJncyNxgnIOxliQE08QR8wMs
X-Gm-Gg: AYBFou0V+PL3RN0ZWBy5EB2ET31u/ylFo4QUmqs4eqkAUbeU/z2hO8O2Z6e/LJpAAio
	PKNLPkUbBa2kh9rMsCuD1q5eRGshGMzbhnON1ZifR+sZDdjj0g8N0rWWxZmLtXxYnq6yqenSu94
	Y6C+hM9sIiZmjGMoZoVpco5p5Ok5266HvloDDVMVrZpri3NTRjQ/7LZ7R7XYALpOFOhxC9B/bMv
	unD7Ba8JSZ5di5ZK0ff1AyOAC56aTWhG4P3xfHXD+fhsPyW246BAjN2xCF7CbSy76BLeC6sbEe5
	0F2x8NBcwjiW+LU/rNPJmCyFgI+IslXKaQn+nHAPjaPppq7DTWxOwD9w0zu+0IXNs8ys9aPtHtC
	8eKOrfb0Bjr4L8HqMRvl4+A8pUyaOCYa+ScU5VcciaRtBzkHhM8+mp85t/wTz+JyjqmubVFArBS
	RLFBMCW0xNAWOCFQienw8I9NW66qJeEdLjBUQ1kqSDQtWNygpC7QU+22ICDtzy78Fbb38Jla4oC
	KnFDFivdI7bnHb/6pXFSC4Yno8tVa+pYfS8Vu0uX9szh8WmGEK8s3AyUaU7qgpgU6No8+86GBfK
	Jqt8/F8g2oZ/PS4kfgxP98cRfoPEg0wr0jSjG0vAJEoGqOT5VOTbkunkV9ezuUfYzY1YEKVuaMT
	IsL+so01HJyEuGUKPvfqqc3u7frCz1919Z0R923Ugb1yKfA==
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr319276755e9.17.1793713176492;
        Tue, 03 Nov 2026 05:39:36 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a1dsm24174999f8f.24.2026.11.03.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:39:36 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion control
Date: Tue,  3 Nov 2026 14:39:35 +0100
Message-ID: <20261103133935.2892210-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_053939_094192_FE4F0FD2 
X-CRM114-Status: GOOD (  17.47  )
X-Spam-Score: -2.1 (--)
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bits 1 and 0 of PAEN_HP_CTRL (analog register 0x07; LTRNMUTE, RTLNMUTE)
feed the inverted left output to the right one and the inverted right
output to the left one ("Left HPOUT Negative To Right HPOUT Mute" and
the reverse in the A23 and A33 user manuals and the V3s datasheet; 0 =
mute, the reset value). The driver defines them but nothing can set
them.

They are needed when a mono speaker amplifier is bridged across HPL and
HPR, as on the PocketGo S30 (A33): with the same signal on both outputs
the speaker gets almost nothing. With a mono mix on both DACs and the
inverted left added to the right output, HPL - HPR carries the signal.

Expose them as one enum, "Off", "Left to Right" or "Right to Left", so
that the two outputs are never fed with each other at the same time. It
defaults to "Off" (both muted), so nothing changes for existing boards.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig) and arm64
  (defconfig), SND_SUN8I_CODEC_ANALOG=m, no warnings. On a PocketGo S30
  (A33, mono speaker amplifier bridged across HPL and HPR), first with
  the bits written by hand while a 600 Hz tone played (same tone on both
  channels, AIF1 DA0 route "Mix Mono"): with PAEN_HP_CTRL = 0xf4 (HPCOM
  driven, no inversion) the speaker is much quieter than with 0xf6
  (bit 1 set) or 0xf5 (bit 0 set, the other output muted).
  Then on 7.3.1 with this patch, same tone through PipeWire: "Headphone
  Inversion Playback Route" = "Left to Right" sets bit 1 (0xf4 -> 0xf6)
  and the speaker is clearly louder than with "Off"; "Right to Left"
  sets bit 0 (0xf5).
- The A23 shares this code path; its user manual (v1.0, PAEN_HP_CTRL)
  documents the same two bits, with the same names and reset value.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to get the PocketGo S30 speaker working. It ran the register
  tests above while I listened, found the two unused bits in the A33
  manual and drafted the change and the message. I reviewed and
  understand the change and tested it as described above.

 sound/soc/sunxi/sun8i-codec-analog.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 3335855c6311..7188b498fb08 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -314,6 +314,25 @@ static const struct snd_soc_dapm_route sun8i_codec_mixer_routes[] = {
 
 /* headphone specific controls, widgets, and routes */
 static const DECLARE_TLV_DB_SCALE(sun8i_codec_hp_vol_scale, -6300, 100, 1);
+
+/* For a speaker bridged across HPL and HPR: one direction at a time */
+static const char * const sun8i_codec_hp_inv_enum_text[] = {
+	"Off", "Left to Right", "Right to Left",
+};
+
+static const unsigned int sun8i_codec_hp_inv_enum_values[] = {
+	0,
+	BIT(SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE),
+	BIT(SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE),
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(sun8i_codec_hp_inv_enum,
+				  SUN8I_ADDA_PAEN_HP_CTRL, 0,
+				  BIT(SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE) |
+				  BIT(SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE),
+				  sun8i_codec_hp_inv_enum_text,
+				  sun8i_codec_hp_inv_enum_values);
+
 static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 	SOC_SINGLE_TLV("Headphone Playback Volume",
 		       SUN8I_ADDA_HP_VOLC,
@@ -323,6 +342,8 @@ static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 		   SUN8I_ADDA_DAC_PA_SRC,
 		   SUN8I_ADDA_DAC_PA_SRC_LHPPAMUTE,
 		   SUN8I_ADDA_DAC_PA_SRC_RHPPAMUTE, 1, 0),
+	SOC_ENUM("Headphone Inversion Playback Route",
+		 sun8i_codec_hp_inv_enum),
 };
 
 static const char * const sun8i_codec_hp_src_enum_text[] = {

base-commit: aae83f3931bc3a5497bcc8351b5f954ad7ac895c
-- 
2.43.0


