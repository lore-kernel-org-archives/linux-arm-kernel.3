Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395EC606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RrZySRLr;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=SViwAUTN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z8M3dkO8VWTPT7niqbjTbaNM/dFwMeWR+hAhAlcZSaE=; b=RrZySRLrhSyhHv
	ZbnoBWz8vxeh1HwPLlUeCvcVLwv8pKJFVz4V8D1aCHUhhpxTXsSotsdXMJFIgcnsWp2hB7BghVOXG
	LNPLebdIrWQ1xsbJZlLyz1bG81RBL8mlOkjTIZ1v8ieKIlvk4xbZg6q5qungRqm+iucOtLI/CiYvM
	VY28vKKEADjcgDW/wMkd1pL98PlZxFiCdqP2vOHqt3cO2ynLBXQZn/ZJsX+dwLflc8Kv8lHOGR4/o
	xcjToqI/sUyihK+p/lRPgXXGkJX+gwuLzeU99hZt2N/0onTPnK3eA2oEvaX5Mnv5CG80noI76wSNL
	ZwkyFuk0jFncIovfCJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7la-0000000DHOE-0yQd;
	Sat, 31 Oct 2026 12:00:58 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7lW-0000000DHNc-43jM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:00:56 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 42E4824013B
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793448028;
	bh=Z8M3dkO8VWTPT7niqbjTbaNM/dFwMeWR+hAhAlcZSaE=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=SViwAUTNyMNFROcqxCKLRZ0BtFCXJiGPVADeeukqK0di9ogIQr6ItJKkAOtqMinfj
	 kJOPr+SRIoX84L4pjzNcpN88oRx7Zbku6KEYRxIJp3LaxArjBSeLIR26098z+ag9Qg
	 ik5LPtm8qBGDMTNnvEttlTzHKIGUQf/Xo8Gvr0EK5xLCs6P5XRb8xifbAWBx5fPGda
	 Z/ZZS8/yDZkp1uf2LWL65M6lPPjZa5wHk/QhkeB3MqfVBdxuuykARKqwvd4bKpjnjb
	 hg7od82KozrRp63nx/D/aREhvwT0zhUe8KmxWzIHLQPErC9HCCVgzKnUk2ffxELqVM
	 +oQad9jwQoRqQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jGxP55GZcz6tsb;
	Sat, 31 Oct 2026 13:00:25 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 31 Oct 2026 12:00:27 +0000
From: mateusz.nowicki@posteo.net
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marek Vasut <marex@nabladev.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas BOURGOIN <thomas.bourgoin@st.com>, Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>, Lionel DEBIEVE
 <lionel.debieve@foss.st.com>, Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 <kernel@dh-electronics.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Fabrice GASNIER
 <fabrice.gasnier@foss.st.com>, Stefano Babic <sbabic@nabladev.com>, Etienne
 Carriere <etienne.carriere@foss.st.com>
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on
 stm32mp2
In-Reply-To: <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
 <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
 <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
Message-ID: <f7010f07fdcdb4ff04a0dbfac1cc5421@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_050055_314107_6F825F17 
X-CRM114-Status: GOOD (  19.92  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Arnd, Marek,

On Sat, Oct 31, 2026, Arnd Bergmann wrote:
> I think for the kernel it's pretty clear, we have to revert it
> to avoid the regression on old firmware, at least for boards
> that have ever shipped with that version. I count eight boards
> for stm32mp2 in upstream Linux, do we know how many of them
> are affected by the ABI break?

As the author of the patch, I looked at where both IDs come from.

0xb200005a only ever matched ST's *downstream* OP-TEE 3.19.0-stm32mp,
the base of the first OpenSTLinux releases for stm32mp25 (last update
2024-11-25). No *upstream* OP-TEE release ever used it on stm32mp2.

0xbc000000 is used by:
- ST's downstream OP-TEE since 4.0.0-stm32mp-r1 (2024-11-04), the base
   of the current OpenSTLinux releases, up to 4.8.0-stm32mp-r1
   (2026-10-27)
- upstream OP-TEE since 4.8.0 (2025-10-24), commit 11d68b6754
   ("plat-stm32mp2: enable watchdog SMC service"). Before 4.8.0
   upstream OP-TEE has no watchdog SMC service on stm32mp2 at all.

On the Linux side:
- 89fca38168c9 (v6.7, 2023-09) added the node with 0xb200005a, which
   matched the 3.19 based firmware of that time.
- 7a57b1bb1afb and e9b03ef21386 (v6.15, 2025-03) added stm32mp21 with
   0xbc000000 and stm32mp23 with 0xb200005a on the same day.
- ae4d08bbe3f4 (v7.4 merge window) moved stm32mp23 and stm32mp25 to
   0xbc000000.

So from v6.7 to v7.3 the watchdog never worked with upstream OP-TEE,
nor with ST's own firmware since November 2024: arm_smc_wdt fails to
probe with -EIO and an IWDG started by the boot loader is never
refreshed. That is how I found it on a STM32MP257F-DK with upstream
OP-TEE 4.10.

A revert would move the breakage to everybody running current
firmware. For stm32mp23 there is nothing to restore: ST's OP-TEE
supports stm32mp21 and stm32mp23 only since 4.0.0-stm32mp, so
0xb200005a never matched any stm32mp23 firmware.

About the boards: arm_wdt is enabled on all eight.
- stm32mp215f-dk is not affected, stm32mp211.dtsi always had
   0xbc000000.
- stm32mp235f-dk and stm32mp23xx-dhcos-bb can only run firmware with
   0xbc000000.
- That leaves the stm32mp25 boards: stm32mp257f-dk, stm32mp257f-ev1,
   stm32mp257d-engicam-microgea-rmm, stm32mp255c-dhcos-dhsbc and
   stm32mp25xx-dhcos-bb. Only those still shipping a 3.19 based OP-TEE
   need the old ID.

So I would suggest the opposite direction: keep 0xbc000000 in the SoC
dtsi, which matches upstream OP-TEE and current ST firmware, and let
the boards that shipped with the old firmware override it in their
board dts:

&arm_wdt {
         arm,smc-id = <0xb200005a>;
};

Marek, would that work for the DHCOS boards? I can send the patch if
you tell me which of them ship the old OP-TEE. Your OP-TEE change to
accept both IDs is a good mitigation on top of it for anybody who
updates the firmware.

Best regards,
Mateusz


