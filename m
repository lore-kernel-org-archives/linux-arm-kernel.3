Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A82606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dzJfCxCr;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=KDs36gqI;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BwAB4lVo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yYe6CIEzHHIU5GeXhJHljatRQTHK1/buaPUEJDpwMkg=; b=dzJfCxCrB3FACq
	4aZORh5AP91BgEbi1WdCFeIYCFRJuQLO4fpsF4S+S3hFDKyqpMMlh47Ku3MPTFOkSuRiJSLwPrWj+
	/Tvwe3N5AOd/68/iQpUb/4dpxH9fXZZZJ0IOOjk/0njRVnugi9wnBf8XrAiUjPIWQCKe9XNQForI1
	vKXKNLWNHZp2lkOeOXfkA21rqStLEK1P3BcGwqVW5MVDd6UCwlUGIOG8anjljo8pGKM5sEcnbQClI
	yS7GMl6STzGN/ngmZMRA/WvZZPyC6UhN0s/5x+Q2mQgv4g49yFgN9P5wmDpiOs8ihwrTL1+nC6Hx/
	mywyhaBTMKRK6ljowXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuC0-00000008NTn-3mXs;
	Thu, 05 Nov 2026 09:55:36 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuBx-00000008NTF-1ZmM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:55:35 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 646EB1D00181
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 04:55:29 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 05 Nov 2026 04:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793872519;
	 x=1793958919; bh=yYe6CIEzHHIU5GeXhJHljatRQTHK1/buaPUEJDpwMkg=; b=
	KDs36gqI3uiWbSo5Nq9ioN7evjZ6TcDxqEJJ2uFOVOZFaEWZu2riXOj793mSnSXW
	xCXBwKkiE1r96MCzEPA1Eoyk7rSNPF2UqnxP43vbJxPc3UEo7xPrFaEEOvR6i9Ug
	pxqixVIo65QLZYGCT+JIs1CzBBlmuydRpFOSR2tdIRpgnCVKUlfctmuib90ERZkw
	Id9PxNAs55xhYT6fAWZlNezQFasWf0nxcVjEyiVN6R2M6eaqjQaWp7tj6cKTf1s/
	vcJH455QbYD7/+ML/3QjAwOvnhBkOlaNqDbY9biqzpM4rVfP9Nft0sF4tHsYWHAO
	ssrgnJ5CZ+pYHq6gKe8R5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793872519; x=
	1793958919; bh=yYe6CIEzHHIU5GeXhJHljatRQTHK1/buaPUEJDpwMkg=; b=B
	wAB4lVo2hy1QNhQ78Cm9AX0hg+SnCZ4foAEUota4c2DUNe7kFUMmJ3VR8DVrEHHQ
	4mvMquylkKwyVJFqAaYcOV01zgE+awwLSKHHHPA3yAeUSjW1jcY/cxp5bQb6EXhz
	K+RKOaAA0wl8eqmUp8l5Y+rUkwif9pEo2mw39Q01DT6mceUYasfS32p9xvTN1JY8
	IZ6GECymD1zc2ozfspJH1LQujNAwe8r0cRy6a9ZB+XPdu0EwW5QUQkFub4ZYsR16
	Fk5+i5r9OfsYqsv/c4ZobqpIIJuOhh78fJD2k7z4p7M5eReU243QEZU2cTz05aw4
	4vHue3vEba6VFXs4ZWkaA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793872519; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:CrpY7HvrX3L7Sngz4xobmEn4PX1/eznLkytKpI28vh8KzkP
	S3UDzsdotC0CUMs+nxv6kzPQMliwQ+NeGM0Pm3vVPFXlWgEZlZMSHXh4R/hB9/gu
	iKPewL2wqZINCrgU85cuOskew7j9XLYbhs4JpT5JqHY6jAb9fRn8J2bdvH0eF4C3
	/dhwKycWD+RK4pvgt5uunHUNREvA5uTw32gSdfoER/s+g4+RXB/5pCJbWIJZ5McK
	ijQVp93b3BXqoIm8OlS49bfrAPOeswLtdm4tJk/FEaC46pDZW7VYQ5btftue2Rfb
	k8MHkMv1agcaACuB0T4wnrmxANzttqi/S907qSA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:P8Kh0SV27nFzy5+qlPgzS0dQZrOaPuYkmuY2IvHDwAQ=:uYdk09vuVwBFCmYlcqg2fixxKgonfy3RDZ+Q6EFVc9k=;
X-ME-Sender: <xms:gVLsaj0sbFfE7q-z85_VG37V1N-9GAI68Z5wFUuJMYYZTLKRCJPQvw>
    <xme:gVLsas53mPKtRA_S4BIa_NQfLvB1kxOBSjVhzJxh4g6z7ZQEXchKmKAhGLLiw-Cbb
    kTgjARPTyMi_ArTQMVe1bXjiTERHxBKS91Tj52UoJX0uxRCupwTg3I7>
X-ME-Proxy-Cause: dmFkZTGPZKrpK5u23rORwwLT4VcYjpOGZf3598mqc5qOQMCBzaafa8Wy9yw28dXD8b1Z5T
    BgrdmYNHuIX42ZpBNE+ClLn/OyWCusOaI+18SMDwzRoinwpq/yxS3TOrzxLu5FFRs/lz6p
    9DxH/iqqZ8vrPgnc0wkHjaW+VjgtHRLStx/jdwKMTtPgPdJ5JwwjQw63HXILQS84TNn/kb
    6l4x6O3QdVWX3fZtkZbX9w3Lf6RHr3xqZY+/QESgnfLLhr47EWqmjfdbDxM9E/QD3qKNoA
    tK5npRZx09cl7kB2b0YMP9gm8f5/PeyrmdlXxPTXNbH3SkME6rLQE+QHfp+a6MAERjnVt3
    qpDeivDWHrTolLr0rANMg8uEwtmRGE1Uux5+t2HMGMTYXcFHaJC01/9kXx7ltQ1ggnQHGf
    WsKMf/HRlPLUeEANPNHdHvBwqY62i9kxY7cUy599e5PW+YBm9k0wxzjjOCsGs1sKIiLRM0
    Mur46/M8P/uatm7Q9qGPYqVetGBXQyEhmUv3KITfgfxM2gm0gZtd/bt5/+r8XDIAxCMZTn
    ZopY865rZ7ieF7sc6TYmzyYO8GztgJHC23M6TOfeof+LzVc9M4N9AhfFDiPojnKO7HPXKb
    /ppbr3a+Tk8kZ5Ld0mQyOQgOkCeJbQwRGRFZJY8W2YUVpaSXZiM6+lPm5gmg
X-ME-Proxy: <xmx:hFLsaoMygJZEtNhr4I2XHpP_ye6aFV380_3Mte1cJTLnO4JVCVUihw>
    <xmx:hFLsavXnyTbzWl7xvLzoQg15tZKu1J8kDPiuVvPWZVPDmsiADGzD_A>
    <xmx:hFLsagbv84RL1yQWdoTVZQbHx9R4vrJtmuamqMSgtuhN2wRJ57XWJA>
    <xmx:hFLsasva9e8PnvS2O-DWbc7k-SeL-2JeR908j6V24eJtdnuBRbEDXQ>
    <xmx:h1LsajVXGhqXW5KkG2wi3Bh6LRcA_rB0wM-ZxI1qIqOMdnJwwMKsfP7d>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 31C9232A0099; Thu,  5 Nov 2026 04:55:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ar0hN4MWufik
Date: Thu, 05 Nov 2026 10:54:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>
Cc: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Thierry Reding" <thierry.reding@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org, "Jon Hunter" <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Len Brown" <lenb@kernel.org>, linux-acpi@vger.kernel.org,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Hans de Goede" <hansg@kernel.org>, "Jonathan Cameron" <jic23@kernel.org>,
 "Mika Westerberg" <westeri@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "James Morse" <james.morse@arm.com>, "Ben Horgan" <ben.horgan@arm.com>,
 "Sizhe Liu" <liusizhe5@huawei.com>
Message-Id: <8f45711b-d415-4694-a47a-12d4b7427e0f@app.fastmail.com>
In-Reply-To: <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
 <20261003095924.1370238-4-thierry.reding@kernel.org>
 <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
 <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
 <autmcaraWcXIoRfZ@ashevche-desk.local>
 <20261104161125.00000523@oss.qualcomm.com>
 <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_015533_764764_9588C98D 
X-CRM114-Status: GOOD (  22.48  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026, at 10:30, Sudeep Holla wrote:
> On Wed, Nov 04, 2026 at 04:11:25PM -0800, Jonathan Cameron wrote:

>> 1) Basic stand alone driver stuff.  Mostly that's all pretty standard
>>    and follow the specs where possible.  If there are gaps start asking
>>    questions. Linux definitely  doesn't support all the stuff that has been
>>    added to the spec in recent years.  So this covers things like register
>>    addresses, interrupts etc.  All fine, hopefully a subsystem maintainer
>>    can take a look and will have enough of any idea.  If not ping the folk
>>    on this thread for help.  Things are a bit flexible for consumer type
>>    devices where fixed and bodges are common, generally less so if it is
>>    server grade hardware.
>> 
>> 2) Stuff that is an ACPI spec gap or place where we'd expect generalization.
>>    There are several examples of this on list this week and a few more in
>>    my inbox.  The particular series here might fall into this category.
>>    I've not figured out enough of the details yet to say definitively.
>> 
>
> Nicely summarised or categorised Jonathan. Nothing much to add.

+1

>> I'd also expect a driver using AML as the target interface to either
>> point at a published spec doc, or to include some snippets
>> of the AML - that can be a lot easier to read than the driver code
>> (imagine reading DT by only looking at how drivers parse it).
>> 
>
> Ideally, it should be just HID that any vendor needs to publish unless
> they make use of any custom methods or something device specific like
> DSD/DSM. I would expect most of the devices to use standard methods and
> properties that are already well defined in the ACPI spec.

>> Given that has new ABI etc, I'd expect that to have gotten broader review
>> as well.  Probably keeping it to linux-tegra and lkml alone wasn't
>> going to result in anyone noticing!
>> 
>> https://lore.kernel.org/all/?q=20260929095915.2215685-1-anrao@nvidia.com
>> 
>
> Agreed, it shouldn't hurt to cc linux-acpi for such driver ACPI enablement
> patches.

Is the "BMRQ" in
https://lore.kernel.org/all/20260929095915.2215685-3-anrao@nvidia.com/
a custom method then? 

How does this relate to the EC and PCC interfaces in ACPI systems?

In current mainline, I see that the bpmp driver is used on DT systems
by the tegra specific cpufreq, memory and pci drivers, but I would
expect that on ACPI those all use shared drivers. Are there any other
users that are not already covered on ACPI?

     Arnd

