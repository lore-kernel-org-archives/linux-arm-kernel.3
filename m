Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0DE606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hWbZ1htw;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=a7hDHAvp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=k0xJz9F6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=; b=hWbZ1htwZcK957
	6F8SB9LJ0DPFUSvTUawMtjlJ++XU/QK1EXmzbJ/sVPmxX++BUCVOPl2tXjKrXqxexHfV6xNu+Ao17
	pT0PJiuDxlvWCdFADm7jFWEFt7Qe/sc2LX3Q8FtG9szn8F6c+o3p5P5VPGA6f29RyoNHZBwhpwaGj
	8ed5YK5W+KGkWkV91yFIt85uXbj0kr2qLoLRW9TUoQ9HHJH0fG2DH/VgqM0jSSLr1rGyS4SIugiHe
	JtIqG6OsEoL06p8ItBrH6/5hSYq47zc5RKo2j+EpW0Ur2AHY8NY35TKfLR8SMO4kkKumjEG26yWhp
	UZ/6Erunio/HAkv/9SgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvlX-00000008fat-2pzG;
	Thu, 05 Nov 2026 11:36:23 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvlT-00000008fYC-0HGn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:36:20 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 092D51D0015C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 06:36:18 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 05 Nov 2026 06:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793878577;
	 x=1793964977; bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=; b=
	a7hDHAvp6iGQl/VgWJxoPh0gFBRnnmenV+cS26b/0Ma4p+uLjZu8gXdUWAaOBUAe
	C6BcgM5N+W7lngeN+YUYBDmUbuYNGIi6bUL/OqeEByc3RLyT/TCMFpxZDHn1idFu
	cBx+yy8BjDIgUMsoFbHISIROD/spoaoEsHqhh6WH1GnFlHh/WTb2e6fbz/3Yufsx
	CMJS0H6SX2o8uqasyQqCpwWcmwE78icwe43ombtUfwU9QKm9hvYDwFPjheAPwi9n
	b5S2q3EpoqO7Y/e5qD5wwS9efooK5rrUz5FW8OlC5UK2c9jIArMaLEOixM4Mn5LQ
	WEIyE5q9ipgz18Bva0MaoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793878577; x=
	1793964977; bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=; b=k
	0xJz9F6EhElOEFYFigQ8Mdq5OVyDn9nDK9j/yttJrKsgSUdIrD0V+W0Qj/G0n3gS
	rJXxIPxlwdBvfZVq6ROzDMBAEZ7MHEGCZAN+2T3ay8+DHQGWdhPwCmVMomDcMMaW
	vjXhZNKUpA8pOahsiQQTBROKV+nU6HJ7sY+T3EsgwsnFDbvgCTstaFRnsaTxK4Oj
	p/bZO9jLZFWL/KztD+0VAao9tAcbOTPL4L7j791EH8cpfdzZn6IAjD1nC9XNkixZ
	enxD5yUlQTevZV4QEsc7/BJwvMZRkQzl4WHvPCM0yipBT+BdLspg3YAYuEpuhLRH
	T9QZSnjgOmSS8NInCNLFA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793878577; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:TLWaqo2O83v/XbEZt/Drezh0HGfxLFTepYyPMgE1teYWWss
	gLenlDYcp762nRkMkDjuQSl8gbJmB+T8g9x/o00K2mgOxkjZ4zV0Xv8gFsWkVo4c
	5WRHTAB2G3KC7pz4q1YaPTu1qrHF/cx8A5HJl37P4lofkOuVA4Jf70/2GWhgA+4Z
	s/Euk9bWxfiebjESODW+BEaazyTeZDk2yVYXfI+fDGtRELuuT19MuE2RtuEEqOhc
	ykFL12/aE1QCzHdNqunnz7U5y5kJ9wab4vtXsshl0rv3n1QLjjwHT6ZDbPHYqfc1
	pBl5HsG9+fqAyDgtArZNULm4/rB9Q479DHBsfmA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:cClI5K0OhrlsXlcTkzwItiqWTa9zdVFH/mNK0aype/w=:4YuJB7yJn3hvOe+uv0QUJ7U19Zk9FgiQxUYecbj5q5o=;
X-ME-Sender: <xms:MWrsaiD-FkQr3vvIVxwnzOquTpvelrtwGb0IpQ56dw05ShOs377WvA>
    <xme:MWrsat6KtQ3_6kB0RwzBNpBsXtz3KyR-u-Ke5EruTdxkGqodywOrVtkBdqcCs3mGx
    PbtbIGecLqgmby7S-BFO0mO-Ns2wx23v1CChIRiBggYHjBgtxVWOnLp>
X-ME-Received: <xmr:MWrsau1TbhUFJQcOiP1bt5IejgRx2gQbEf5ApejG1JQoekddmRmMzfT3eqdb0vNUVKsC4U08VezPBinNbxNAfVykxbtc-Sl3vo0>
X-ME-Proxy-Cause: dmFkZTG2SUO3JG85xCfjmNnh4lRW2W10GxrhMDsYtjMEXNviJUCuz1KkOTClIZmZNlc4qF
    sBzABO3Hu9mM/E6Wo7sUNWSAhxQM/sNz3mTs2mHCzcd/mtE2TcaBT51oE220dDOc38ULk2
    P2jSElP2khLz9YVxz9Uisd1BVbNhQ7QxZrO21vDvwE3DJ2OLliM/K4W4p4t06Gx2ct1KfW
    D40Nbem3eEsLUZEEaYf0FX86ht4Csqqww6G0XPE84wg5LO5Z5UnDRA+06s3TE5V0KZDQFz
    Y3dXAZB/w9jEq241SmtR8vWmC1ny1SvPeU/lUeRWjuya6hYM92ViDOFx+ei6QOJboktXkR
    UsIIAV7usvfOlJS7stIuevwpV+XjgbxlJBilNG/j0R4pfhzTR7gsLHLzconhcT2H1U2cbn
    oQT4TZk6JS53Hkv0jgz6Q7GNNdHYn0cbroGUPMXG6eJJnSO9TnN/n6rXO65hXeehBGyiMM
    GEcIbY3YvyWTmT/+XQY/lMApdlbyQM0ncwaWK6tMN4iQkwMKhqrJX5af3RU2FxuYYPMNYJ
    mQIVtSFD6AyAhix/TbCyWfu1QPW8Iw0WwyhBjNhRpVDhTOoYprE+WxAsIXEvAYgmlqKMtY
    7/1j1shXNhyXAnCaSkF+U94Gg1exFSHfEgGxPbJIi0HKb4JS4g2+N+kLkZfw
X-ME-Proxy: <xmx:MWrsapBg0yd2G7Fh4Tn74g3ER6b-brWrGYj7jYI_gjDXrguON_LOEQ>
    <xmx:MWrsauGGJ9jWwhBczf8J1xs_n3K0lJ33p6VN6_-XaAWw0xbrETBo6A>
    <xmx:MWrsamTxURatf9Gb0V2i-nZt16-6ZV398cVTv2YK749Ic3vdF01uxA>
    <xmx:MWrsatPx4hE1KkCQ4o1yTJ2RKfVucohUUPVAgqNl8bjXWiTd4-CxGg>
    <xmx:MWrsapDWmkP7b4M9mzB3-Pu3972rlvt275lqxTnqDgtaJfL51gmVvRxB>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:36:16 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Thu, 05 Nov 2026 12:35:58 +0100
Subject: [PATCH 1/7] arm64: dts: apple: t8122: Keep ps_apcie_phy_sw
 always-on
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-apple-m3-pcie-v1-1-e00a72a604f8@jannau.net>
References: <20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net>
In-Reply-To: <20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Joshua Peisach <jpeisach@ubuntu.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=j@jannau.net;
 h=from:subject:message-id; bh=4YuJB7yJn3hvOe+uv0QUJ7U19Zk9FgiQxUYecbj5q5o=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqw3WepiK+12yauLnju570ZAQNFek8lmP82WpHfwPPkwS
 frv4fK1HRNZGMS4GCzFFFmStF92MKyuUYypfRAGM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRffsnwT/sKI/OUN6ta+04ZX/wXUJW/pl75qfGJm9xb52W+mXn57wyGv3I/3k/
 hLvm4RzNhqYHfkz0tx9N9j/3UyNk/f+py3pwmHy4A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_033619_149684_34D17F90 
X-CRM114-Status: GOOD (  10.37  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The APCIE_PHY_SW power state is in Apple's device tree a child of the
virtual storage and general purpose PCIe power-states. MacOS however
keeps it always powered on. Mirror this behaviour like the M2 Pro/Max
device trees already do in t602x-pgmr.dtsi.

Fixes: c65ab4905e58 ("arm64: dts: apple: Initial t8122 (M3) device trees")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
index 3f8be74b5ea8..3206787dd208 100644
--- a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
@@ -899,7 +899,7 @@ ps_apcie_phy_sw: power-controller@4a0 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "apcie_phy_sw";
-		power-domains = <&ps_apcie_st>, <&ps_apcie_gp>;
+		apple,always-on; /* macOS does not turn this off */
 	};
 
 	ps_atc0_cio_pcie: power-controller@4a8 {

-- 
2.56.0


