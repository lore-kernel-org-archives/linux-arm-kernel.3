Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E37CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAZjNYlYoUxbND97FHyJPKGZ9OtZP5oe5PR+eT/X57o=; b=uA23VCJ9JGi+VW+Cm+Y1A1DnDT
	8EOrqyh4zHJbTCvxck6Rjltpp9UF4/7nlm9BUrjQCTtABnUSuQtCw/cbpqHFbOKi+ZJPzgalwvnm2
	DZpP+9lMlK2ghzGPvTdJckgyHBa8Sc1RPNXjmJaYo4MBYem/R9WUBA9cJENA8qY/zp4vgaGi+9Wux
	JEfQqgONgZNMJH5ObO7uk+jA9qO9vboKyQUiwZ0Gp81FoDwdR9SCkrHYkzkCQ3euOw6lSRV2aN1TP
	59dt4bwfGkrhaIEGySvuaX+puC+6SkvAJC5ChLbCdzDLC4YBSV5ttozi7W6ifBaO6VzIgv+vtPUpb
	U5bGT3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7v5-0000000GOKf-3eTS;
	Thu, 18 Sep 2025 06:15:03 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7v0-0000000GOIv-2vGb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:15:00 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 81707EC023A;
	Thu, 18 Sep 2025 02:14:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 18 Sep 2025 02:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1758176097; x=
	1758262497; bh=GAZjNYlYoUxbND97FHyJPKGZ9OtZP5oe5PR+eT/X57o=; b=D
	MIErtSdGQsA8Zm7ALkGb0vERfSF3sDzEujzZETYjMRm8PIALsq94flKrswIi2a/A
	UF9A/l85+CFRAZFsPcoHVKvManfDah0Ebt94bZRStr9UFgmiLr0MCHVh8QUVZnNp
	WQY4Fvgq8MjCL0dUCGHIafMLFw/GczMnLBGhbpT5Br9w1I5hBGYJKMloYXERQxDn
	eoNpm/5wv8LxgLXEkoKDgq5RzOi5JRPFXwoWYpbl3qN3pVZUcI2INZF5LaYEAbQ9
	xL4cdd7P58TqPcnot0kPEfJGLmyPEFegFnrvmXt/wDAVnzFnfihninE5CYbJA70v
	j1ut7FNWIZ3owJgiCy6Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1758176097; x=1758262497; bh=G
	AZjNYlYoUxbND97FHyJPKGZ9OtZP5oe5PR+eT/X57o=; b=AeN/LF9hcZ0cLwJ13
	5ONTkJFqEG1yRGw4kSVxydeAB/ZrTWjT/6Mwg/2cfQOCshwPg/DOKrRIg+6Z80yp
	bItClD6V4N+nM6Fg8FWRBkbz9oKZ9q3T4Z6O4CytqQRFgAb94Is59Hvf9a09mMwl
	NP9dE9Onl825HvFGrJzO6ZkW+X0yDMq+7njClNguAMlVvWgeTpp8RInJLW5NtCyR
	rL5iupaj84Iq9/bG6SYoighzU0dEitEd3URPWW+bArhp1uU7YBH7W7AwW7PBX4Hl
	EYE28zQ/D5BpxAfGl7ytuCZyFX33mcNmiwfIEDBWaKK4S7x7CKO9OnRtzjjQlLbz
	314tQ==
X-ME-Sender: <xms:YaPLaBVsLQHcihVDYLexymSFXy7NCcLBNtSzVBY-rYq-09mS7p1uhQ>
    <xme:YaPLaIUzkasV_ob52O6wMxNLdz86_ankaTE0ogE9W4su5GmMGircR_WSwK6e6MJY9
    XehKJBRg5fPdx0SDBs>
X-ME-Received: <xmr:YaPLaPJNbIjNhgmZdg1kc_uqJumvXkDbEKVnpcln0jqjoohpD4flIlqTMHvPMMh_VMtP8M12WY6mqflRwvdLVTakBa9wXB9Ci_TrDDKCS2oR5Sg8avUa729GW-sA4zlI4Pl_AsqeJEVck8t0dD9Acuzklc4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegheehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforghthhgvficu
    ofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecuggftrf
    grthhtvghrnhephfffueehtedukeevjedvieevffehjeeiteehhfefkeehgeffleefleej
    udekgfevnecuffhomhgrihhnpehtrhgrvhgvrhhsvgdrtghomhdrrghunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrthhtsehtrhgrvhgv
    rhhsvgdrtghomhdrrghupdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghu
X-ME-Proxy: <xmx:YaPLaABxWqJE67P_sMLCdLD5pOahm6I-akTTNnAdIHTxs7O1GI03WA>
    <xmx:YaPLaHfSlJuGRzTdHF-ZHZRU98_JM6QP8A-nseRJtZnRu7eYEAo_xQ>
    <xmx:YaPLaH22qKw9JoZ1Dg0kCRuXJHCDcQU3KFT0bWkIt387_mJtQD-drA>
    <xmx:YaPLaGi3p8qbOcphcpzeRRg8egCaQN1OHMF1QxLcElzTPfdK0dlNAw>
    <xmx:YaPLaCN5QQHc1qD2P9FGBQQlZ5s2P4GKFrkV5Fjoo4rqjfYH5MsG5d-y>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Sep 2025 02:14:54 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v5 2/2] arm64: dts: ten64: add board controller binding
Date: Thu, 18 Sep 2025 16:14:41 +1000
Message-ID: <20250918061441.5488-3-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250918061441.5488-1-matt@traverse.com.au>
References: <20250918061441.5488-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_231458_806463_3950F503 
X-CRM114-Status: UNSURE (   9.03  )
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

The board (micro)controller[1] is responsible for functions such as
power supply sequencing, SoC reset as well as serial/MAC address storage,
bootcount and scratch registers.

There is currently no Linux kernel driver for this controller, however,
there is a driver in U-Boot which utilises this binding.

[1] https://ten64doc.traverse.com.au/hardware/microcontroller/

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 3a11068f2212f..71765ec91745e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -253,6 +253,10 @@ usbhub: usb-hub@2d {
 		reg = <0x2d>;
 	};
 
+	uc: board-controller@7e {
+		compatible = "traverse,ten64-controller";
+		reg = <0x7e>;
+	};
 };
 
 &i2c2 {
-- 
2.45.1


