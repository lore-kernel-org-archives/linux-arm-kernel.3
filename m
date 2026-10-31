Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8FC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 08:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=emVHIrN9;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=iOjBj1M5;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Tg5JJ1LZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=msGgE+yF4ldZ/hVSYFnQ0w1ommr92ISaYkckmm0P1Lo=; b=emVHIrN9ysAen4
	I9l2WcBQ6MBkBUEwS7mt9gCwtdI5c0YG/Y3zvlrAiYYlnwbM14PV4l5nkbzTkIME7gj7+Ucy3LtiE
	uQ3110xEwRUAYopIeN6XTfHaDuCctjkkHXjX0wOC2jIQeu70UAqhRVfu0JKJTLpi0z6tDienRmFB9
	LI1hJIJtE1YisRSzVnE0oftt47TDx+zYqArnRxzZl2xQjNkbna31k/EPJH20czJxcBtmAPgQklJ6w
	ljstGlbGBGwuOKfLW++CxQ4U6B72k+tavcynxTVQmTijNrCoUJvBQElm60wJo+lejEsRzPWnq7AIW
	FAzcsDQJm0M62lUntWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4jJ-0000000D5ej-09UY;
	Sat, 31 Oct 2026 08:46:25 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4jG-0000000D5eN-0auy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 08:46:23 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id D4B131D00139
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 04:46:17 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 31 Oct 2026 04:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793436368;
	 x=1793522768; bh=msGgE+yF4ldZ/hVSYFnQ0w1ommr92ISaYkckmm0P1Lo=; b=
	iOjBj1M56eoItO6tNRWpq2cxUbDavNE8q8cgYQB8Z49EaYXHr6M9cTTdtCFyBzTZ
	tCNcwY7tUDBxv0sLxjO8rD7nR6YXRN3BRx9XUQkB5q5x9sXkCkxUdr1IJf5UMLcR
	7rq3QAUXwHp/BKsugxXKubFctv9lpDTB8xFPllNF8PipfPJQPNmjurAcQp2g4ejL
	X/TcQ6SVMEnA5O2FuVZ6d/hN/S9TRYCURWWe3qVE51pErSBA+jA1PdmjuwY9i/5T
	PaNBDB0Fpz4AJr2JUWMo0RvVSfwpHSRmFBuYzMLjvk/cExDu7uYNak8f+zExlU1M
	R1VKBw2xoc7hN5denXaovg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793436368; x=
	1793522768; bh=msGgE+yF4ldZ/hVSYFnQ0w1ommr92ISaYkckmm0P1Lo=; b=T
	g5JJ1LZTqOr8WLikhg8u5M4GuboYRlxoHDqnR4QG+zo2qnYZkh0VO7eUlN6ONrLm
	Jm2FM8LfTXCqbw57UHhKVgcVhUj5VJmGaA0dKC2gA398dH6qz1iZGkvBAZaTRHLn
	Iv12ng0ROVS8CTyrns1iX5G4SOPPR3tBq0VJT92Snba5erex6WUM8Mi1KVfnKGjN
	gtfVZq1Sr4ewuox7TGsvDN+6MCO/AMfRObXA5yJQs8JInOk4+/OUErW3FOKQQ2Da
	/0nzoS0Ln9M7FstcNb4BsZ2ihpYmaonQsRqxewaexopQFJFQp51LfD9ead7flsV1
	qYfw2yyTz+kogXCAtmjuA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793436368; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:f6It4pKccFbZpxXAqkoZPZv/0SStf9LqNBcUtXSLt7zOaaD
	Ln1x5w7glahKp2xeICFdXW0+YT6Z4tBQZNim59HiLvdgZXbZrKt52wSzn74Ycdzp
	Sf8/2F244mQRDRcfuu7uvgnsIY+49lXCsHP961UjEArFDtOaV68XKM0AYHCNo03R
	elhGvcRuq9WT74xAsVHxi6jij0m5m9juQOzv/ku5j3dkllplTSosPXW0+ii+/FSr
	nE+vkMLsGgXUgfNgqZt+bbgLdafEJgayW/lSINpZn4cLaDJ/tvJ8VFOQU9hgOE4E
	SNh9RBDy08WDcW2NT1cTqTryiUr1sS2SdMsoGdA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:DBCrIjIkVPy9E7TbpmIDmzZrpDEjPavd4lx9kW7Prm8=:+rGYpdDfWx7RnLSKI4uxQpJm3+zNhvevO3bKngOM/Y4=;
X-ME-Sender: <xms:yqrlamhADgRXWsgMZcJ4Y-RLw8kZzAmKaFqslTYZ2vH76HGnCkrgfg>
    <xme:yqrlah2wXfPeSYUK0Cr8IpNXwIH8fmTEGFZ79feGD4APuyusVHzzMZRZ6sAb_Dr2J
    UEA_Qn2WeornjlHq1w3mWLC3BCp3unILXDzHG3b6nH5jUzJMl_GokX3>
X-ME-Proxy-Cause: dmFkZTE5t6BGJhdkGVNsXvVFxG1PcWpcpaMhViOBoS29Z4IFtbWTY5VslSFz/ieBRekhxo
    8wE4Rgao449UxofVC9dweH4g0Im1LFnNKfP2sUCQBPMznfpFmE5IYIhsHxHZrSWuhcxPjj
    pFGWB+EiTp7IgKsYCQnEKT27KjFC5JUGCrq90pwpSk7L98jXiXTk3iQml2J58lotNEd8gk
    E+reYaX61yAaBKmrs9EjDyeuxBtr3baeQ99ms++NR/C20r8cY9vFIGZsI8NFPEpOHnU7ID
    JbMacxnBrf5AClPeqJAsllU/qrRvXGtIzSIotIk6zgZLqaZesMWPn3562bGEWrPEN0QPav
    q2zlKF1LO8u/1VfYLjkzXVPNxpGg8ZdoHVwjOs0j1cqD1a5U0H8L4e7i39D9ev8uzaFcF6
    ZySz0D90KOc+Kgj8OZvr3mzmRhVLBtvITEsiXM8VdcdlfkJ2XFrTint9fbXg721C8r/mG+
    N7soSFDGhlUntFCl7zCPF3C4rgGRxk3nCAqVkxrF45o4KtrHrqaiv5X/5/k3H8QtRwt53L
    YbL1lpnolpfqE78xStkmXVblwFabvKaZzFcBpwNoHauXyNj/hEr+zd1y9QJnfX7yg9fNt/
    9/kSKCJCTcH9zgKaMcuX+y4oCQKBh10y9hX4O+RIJCv1XGdZ29EWldvw7mfA
X-ME-Proxy: <xmx:zarlasia4nTnHGA1Uoq7Fhc46-NVfVxCW-0TsLMswAsmRJ3r56iqmw>
    <xmx:zarlap6KPH5HrHfekntMhXpGMKYngs2nIF2zligOZDFZ1irTW9A_4A>
    <xmx:zarlahoKJUoYhxylNVHM6OU_amnGKVZrr3JPvAZ71CgWQmRGzKaboQ>
    <xmx:zarlavV4c8EyBAN3hieIRNj0o1hlqPkqd72qTJMHJ53A8RzxHKFmZg>
    <xmx:0Krlanumh2_K8AaRftPevYqxuaW1fUH9KS3HAjRN5X0ZU5e8ZXinJ0MA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 39A3632A0097; Sat, 31 Oct 2026 04:46:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A4AbHx5UfGss
Date: Sat, 31 Oct 2026 09:45:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marek Vasut" <marex@nabladev.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Mateusz Nowicki" <mateusz.nowicki@posteo.net>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Thomas BOURGOIN" <thomas.bourgoin@st.com>
Cc: "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Lionel DEBIEVE" <lionel.debieve@foss.st.com>,
 "Amelie DELAUNAY" <amelie.delaunay@foss.st.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel <kernel@dh-electronics.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Fabrice GASNIER" <fabrice.gasnier@foss.st.com>,
 "Stefano Babic" <sbabic@nabladev.com>,
 "Etienne Carriere" <etienne.carriere@foss.st.com>
Message-Id: <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
In-Reply-To: <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
 <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_014622_462875_4865BF48 
X-CRM114-Status: GOOD (  22.24  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026, at 06:59, Marek Vasut wrote:
> On 9/28/26 10:45 AM, Alexandre TORGUE wrote:
>> On 9/7/26 11:14, Mateusz Nowicki wrote:

> At this point, with Linux 6.18 the kernel is trying to trigger the WDT 
> using SMC ID 0xb200005a , which on my machine works (older OP-TEE OS). 
> When I boot linux-next , it is using ID 0xbc000000 and my system reboots 
> after 32 seconds. (not even mainline Linux versions are consistent here 
> now, sigh)
>
> I actually found this behavior the other way around -- while forward 
> porting a system to the new OP-TEE OS 4.8.0 port, which I installed, 
> then booted Linux 6.18.y, machine started rebooting (SMC ID mismatch, 
> new OP-TEE expects 0xbc000000 and linux-stable sends 0xb200005a), so I 
> booted recovery, and ... recovery is also Linux 6.18.y, so I could not 
> recover the machine that way anymore.
>
> Currently, I added [1] to OP-TEE OS as a mitigation of this ABI break, 
> but I don't think everyone can still update their bootloader stack in 
> this way. And with this patch in place (and inconsistency between Linux 
> stable 6.18.y and upcoming 7.4.y) the ABI break will cause some serious 
> mess.
>
> How shall we deal with this ?

I think for the kernel it's pretty clear, we have to revert it
to avoid the regression on old firmware, at least for boards
that have ever shipped with that version. I count eight boards
for stm32mp2 in upstream Linux, do we know how many of them
are affected by the ABI break?

Newer boards can override this if they always supported the
new ABI.

For the firmware change, I can see multiple ways forward, depending
on what the original reason for the change was:

- (obviously) revert to accepting both values forever on boards
  that ever had the old ABI in the past.

- For boards that can have either firmware, use separate dtb
  files that match whatever the firmware is. This only makes
  sense if the firmware is fundamentally incompatible for
  reasons other than this constant. I think we did this for
  firmware with and without op-tee.

- Add a workaround in u-boot to patch the dtb at boot time to
  match whatever op-tee version is being used. This would be
  the cleanest but requires extra work.

     Arnd

