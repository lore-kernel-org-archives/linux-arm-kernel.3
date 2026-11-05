Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2DD606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ke3BXyJr;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=WTEDvAse
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zg6+H10dxRDg4A+l8T0eI4KPj0H19Zt2rNXESQze/4g=; b=Ke3BXyJrWp5aQg
	dfpZPU09CZeMVccgIPk66FPFsBbc4/8GhW3wPCcWAb5dm6sPZAMfZceUPDVoQTn1WOsltjW8lr2HI
	OPEKHXaPmIM9GHhgzI9AbURIEK8L7Sw6T1lXM9zQDInqKNGBGQ6V0CvOU9pX7GEbB6r7uPdQv/jFQ
	nqegTSMW22UUuywdkF5Ah47L43ZJ2b2iAJTUBErnP9KIz3gZuX+miyaGohl/DV8lEY+JBauaKBfDe
	gIG6Iehe6Zs1LzvhozqPQaeHzUszHbNg1qQufb+X5inp+YEGfvvWIg9Huy5jZWB3AfwQ58PqH5BmG
	139w9XS31tadPy30FwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuKQ-00000008Oyr-0SFr;
	Thu, 05 Nov 2026 10:04:18 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuKI-00000008Opf-3ZXU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:04:14 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id DE8A0240106
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 11:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793873047;
	bh=zg6+H10dxRDg4A+l8T0eI4KPj0H19Zt2rNXESQze/4g=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=WTEDvAseblPFXFXvS6DIvqggdzz1crkr7qmexKldL1D+QF6VDFDwBos58D1WAXyv3
	 nooXez145/Y3nvpTAFevJyLOzVZEelin8K6cFOydaExn4eGjD5nMwO7K8erHRiZnXo
	 pYcBKUZO4Bf1Z99sbBayFWavXtjKASa7uLXodG5SDacIL2j8QCPJDZ1rUUePd/CxKm
	 0gPxuy6+M+DfnBJM9W3mF7/vBE/waqBappf7CXvtt2HFqMsKhwzr+YGhxvVQUqPsy/
	 PqP9nFrOY9xruJfKA+Gu7w00iFruuYpiGZ/Fk6XAaof1+drWeFcq3H5z1NJizIZsaz
	 fI0CMQcEMQKrA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKyZY4ftxz9rxR;
	Thu,  5 Nov 2026 11:04:05 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 10:04:07 +0000
From: mateusz.nowicki@posteo.net
To: Julius Werner <jwerner@chromium.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, Evan Benn
 <evanbenn@chromium.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Marek Vasut <marex@nabladev.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] watchdog: =?UTF-8?Q?arm=5Fsmc=5Fwdt=3A=20allo?=
 =?UTF-8?Q?w=20a=20list=20of=20SMC=20function=20ids?=
In-Reply-To: <CAODwPW992ncQNo1yxrOrAKKZ62TB_U1eYWstZuTKDKqFCFGRSA@mail.gmail.com>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
 <CAODwPW992ncQNo1yxrOrAKKZ62TB_U1eYWstZuTKDKqFCFGRSA@mail.gmail.com>
Message-ID: <2e1ea7a743552f7a9f5aef91e0d8d1c6@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020411_362744_62573503 
X-CRM114-Status: GOOD (  16.88  )
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

On 11/5/26 Julius Werner wrote:
> What happens if you simply define two watchdog nodes in your DTS, one
> for each SMC ID? Both of them would independently try to probe, one of
> them would die from getting an SMC_UNK, and the other would continue
> working to pet your watchdog?

I thought about that, but there is firmware where both of them probe.
ST's 4.0.0 OP-TEE fork accepts both IDs, so you end up with watchdog0
and watchdog1 on the same IWDG. The bootloader has already started it,
so both register with WDOG_HW_RUNNING. Userspace opens one of them and
the watchdog core keeps pinging the other one forever (open_timeout is
0 by default). If userspace hangs, the board never resets.

> I would be fine
> with the array solution but I don't know about the validation checker
> and whether people care about reusing the same prop name with
> different types. (FWIW, in the device tree a 32-bit integer is
> basically a 1-element array anyway, so we might just say it's always
> an array and for SCMI only one element is allowed.)

I tried that. With arm,smc-id as a uint32-array with maxItems: 1 in
arm,scmi.yaml the "multiple incompatible types" error is gone.
dt_binding_check is clean, and so is dtbs_check on stm32mp257f-dk,
stm32mp235f-dk and a few boards that use SCMI over SMC (imx8ulp-evk,
rk3528-armsom-sige1, amlogic-c3, blaize-blzp1600). The SCMI driver
reads the property with of_property_read_u32(), so nothing changes
there.

Guenter, you suggested keeping the IDs in the driver and I have a v2
like that ready (st,stm32mp25-smc-wdt with the IDs as match data).
Julius would rather keep them in DT. I'm fine with either, just tell me
which one you'd take. If it's the array, v2 is the RFC plus the
arm,scmi.yaml change, and maxItems: 2 as Marek asked.

Thanks,
Mateusz

