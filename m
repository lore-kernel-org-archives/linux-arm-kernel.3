Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC66606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vdH0bWTC;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=Ae30KHgP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m4TcohsJzsEPAJsBPzHPQnX5dlEW21LnhghKMfVe/VQ=; b=vdH0bWTCtHsAFd
	VFIh5/pCGxllpsgjfhmp8Vtq+urSiJz6C9n5ygPs4S41L4LeZXREP5iP/2m5zEzVVcVfmi6KU5jTk
	UQ0q1He72T69ffSBycQSE9gyElwCDeUixvCXTX5IXgdnqs2vEzu4XmyuGl6dYBu9+MXzt7+k216zk
	mauCKtVdADJXxAp2RoB1sO3V/VW4eTcJaRgGG/ZIeQ7nSqSVg8bOfaHzaNrckfg87/2kWRr7C2ZmB
	HXA+VfmghqTgD3bWOTvU+REKK4iMRNolmx0mB0vxsqEzKpAalwYf9qBQCy5FyG0BUUGiFfZuyJy61
	9fvShKLq0cUYH1dJIRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGAz-0000000Dgl8-1Du1;
	Sat, 31 Oct 2026 20:59:45 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGAw-0000000DgkE-2Ecd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 20:59:43 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 3E5FD24014E
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 21:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793480360;
	bh=m4TcohsJzsEPAJsBPzHPQnX5dlEW21LnhghKMfVe/VQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Ae30KHgPmU1P5Ej9kF3bnsUs/flIG6V5JJ4q1GEG3yPbc/zFW+1sDUqnlkR5JAykm
	 7FQiUeDChm4GF8FLHjfZeCreeTA07qtARFpdV9g+wBpURBzSMYdwPjUMDnHySzif4S
	 YxMtsM8rTulrPLlSNATSEIMudOQzSQEypsDCdhaZSXn85Ps5e45/1Bh8dlcu+Aqjok
	 H0zKpJORi8RpPT2cPX9LrhJkqmoOMFT7bHPmOVzyuKEmN1XoDhQl7T2LkfkETDmcmj
	 yfNArxusWCt9DFk8wmnLCK8NQABKrboTf4Lz+2gMX2g4vOq2bkXZxFhhMHZ/FgBYfu
	 qDIhKHc7povfg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jH9Lr2kdmz6v4k;
	Sat, 31 Oct 2026 21:59:16 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 31 Oct 2026 20:59:19 +0000
From: mateusz.nowicki@posteo.net
To: Marek Vasut <marex@nabladev.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Torgue
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
In-Reply-To: <7ff5f937-144b-41fc-ab0d-82271a01dde1@nabladev.com>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
 <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
 <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
 <f7010f07fdcdb4ff04a0dbfac1cc5421@posteo.net>
 <7ff5f937-144b-41fc-ab0d-82271a01dde1@nabladev.com>
Message-ID: <799394b5ac7067cd2bb2e06117e53ec3@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_135942_735111_456A0CC4 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Marek,

> But maybe there is some way to probe for the correct ARM SMC WDT ID ?

I agree, the ID is not discoverable. A revert or a board override
would not help firmware built with a custom CFG_WDT_SM_HANDLER_ID
either. Sorry for the trouble on your board.

I like the fallback idea. My suggestion:

- arm,smc-id becomes a list of IDs.
- The driver tries them in order until SMCWD_INIT succeeds.
- The SoC dtsi lists <0xbc000000 0xb200005a>.
- Boards with a custom ID override the list.
- Older kernels read only the first cell, so nothing breaks there.

Trying a wrong ID is harmless. Old and new firmware both just return
an error for an ID they do not know, as your two cases and my DK show.

One catch: OP-TEE answers an unknown call with 0xFFFFFFFF in w0, and
smcwd_call() compares a0 with PSCI_RET_NOT_SUPPORTED as a 64-bit
value. The driver gets -EIO, not -ENODEV, so the fallback should move
to the next ID on any error.

If you and the watchdog maintainers are fine with this, I can send
the binding and driver patches.

Best regards,
Mateusz

