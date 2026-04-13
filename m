Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83000F34C63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iv/pcTfVSlpNC7zw/ioPJR8syUP7va6YCEpuLUEAwc=; b=QENOyXK6n02hpHHrfamBUFQdZx
	14BvMhL6uOhUDlTKeQVFFhgGfpvX7WW8ED6la4qIH+PuyO7ny0sMg4gqVBDm1ned/9NrMrDEm0nlK
	e+OblA1HBls2LbzuTZrRpegfqbdwQl0JhnuxgvvCny08+3kzfa8/dww2Oi7kCRqijDjSWeo02tRmn
	eppigf3+VEDXyumCEmV0s1iQSb7PaNjZjmxZyelR/FCwEJw5n1Ll3lSsNOuDTPwk8kTodrb6qMmPd
	sn1rYNx6qyS7oFW0/SPfDCeKIyNtcytvNU8yb8ZYYMEByWjrFwAZqWPP2a+W6ZHkIlAxu6fsV8R5B
	8+EB3u+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJi1-0000000G0ya-16dD;
	Mon, 13 Apr 2026 16:00:21 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJhy-0000000G0y8-24F3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:00:19 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C4D1C1D0022B;
	Mon, 13 Apr 2026 12:00:15 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 12:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776096015;
	 x=1776182415; bh=/iv/pcTfVSlpNC7zw/ioPJR8syUP7va6YCEpuLUEAwc=; b=
	kJA6OGRcjNDnTIHp9/+o9ZSHh9U87mPaZgP1CwmmfY7MzwbD1aaqBmf4pqbx2oj9
	CA9nc2uYHzCwWiDRhdD7xdmxeE5hww1zGg6XE0EIGZKdpY9fdY1dAybDwqY050jV
	CHeGqwVoOWucCrUshb8+nbkMzeavCz5a+gZq8qC6yEIbnBuhu/YB9Q+asq66prQ6
	6H0vsKgJAbjd3hUF0HU0r4s6qMlifDEIrqTtstf0PARc4QnZQHMFW6Q53s7S54LZ
	Np1WO1WbzjIZCt6MNhqsmbUujAjnIeqkgIdGgAsk+Sux/e3t1j83u2O6e9FQft47
	Hw17JZ5GfI7gL2eHhRxawA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776096015; x=
	1776182415; bh=/iv/pcTfVSlpNC7zw/ioPJR8syUP7va6YCEpuLUEAwc=; b=J
	vg7F7L8FyJXYdEnshDaciGCf9pIcFLCzR6Ene0aVah8RXDmBfwO4I/D3d9sZ5SRL
	PJ5TX3D01Eh3m3eBBavB/Pb70oI+jTdcr8jTI5SXajknnjpj5aaxnapPdTk6i4xm
	lAB2XOZMRDqDU1MTlTs/0hcb5iVewpXmtj20v73LEUw1qCm68NzWZtlIxHOuYpJr
	5GvirjO2QGVhHrJ9h1Jmrv5wHA1TACl3EoY2djQvAlOKfDy5FVi05eEDciHnCi/P
	dr9LcTzns3NdtlWMgS9B1MUkd7FYCsscuTLLgvfcasG3xlv/yfl1DMsLMwWNmVzv
	6+zbP9hjfWjpb7I/mghRw==
X-ME-Sender: <xms:DRPdaVfdpotbO1iYzJjWWlXaJS3HI_WoSltc4WepeMHyXE-PoL754Q>
    <xme:DRPdaeA7q7qiKTkxoFUOnmfeCh4AEYt6wrZGhDTXArkCzVlA45_bCrL8inlNZW0v_
    orrl3be3-etlzj-DOSMsUzgm2Y7rS_Wwulvzl5-ZSDUZdLUYfZO8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkeeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepthhssghoghgvnh
    gusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegtrghtrghlihhnrdhm
    rghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepvhhinhgtvghniihordhfrhgrsh
    gtihhnohesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidr
    ohhrghdruhhkpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtg
    hpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomhdprhgtphhtthhopegthhhlvghr
    ohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhhtoheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:DRPdaf5fXMYwGOWBC0zanDfiF2IuNgZk_f2iUCfvYVFiausgWLXSbw>
    <xmx:DRPdaQe6zPs0blaShvhgRAIWo-HOdiomZZkaBaFNhrGCYsRBTl9QAQ>
    <xmx:DRPdaWcbvINdiaSI1XeAv8M2D9FanhzKGKlthu3sWagepmnnwbbCpA>
    <xmx:DRPdaVEo-67EI4TFYpv1ZRy9W9liAZ64tRhZLtOBgqsKoT83ANCSpQ>
    <xmx:DxPdaUet41BCzQhq9q0SSToBRAc2fnLXzjh2mVL22hpKsfvYU4qlR34c>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6BE7270006D; Mon, 13 Apr 2026 12:00:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARwL1vy566MZ
Date: Mon, 13 Apr 2026 17:59:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <15925544-1ae5-406a-b9cc-af5935cc9f02@app.fastmail.com>
In-Reply-To: <20260410091131-46b6354c-9d06-4e47-9345-ee224d8528f7@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <20260410091131-46b6354c-9d06-4e47-9345-ee224d8528f7@linutronix.de>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_090018_572493_CCCA073C 
X-CRM114-Status: GOOD (  22.74  )
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

On Fri, Apr 10, 2026, at 09:24, Thomas Wei=C3=9Fschuh wrote:
> On Tue, Mar 03, 2026 at 09:50:33PM +0100, Arnd Bergmann wrote:
>> On Tue, Mar 3, 2026, at 19:11, H. Peter Anvin wrote:
>> >
>> > The time zone in the kernel has never worked anyway, as it would re=
quire the
>> > kernel to contain at least the forward portion of the zoneinfo/tzda=
ta table in
>> > order to actually work correctly. The only plausible use of it woul=
d be for
>> > local time-based filesystems like FAT, but I don't think we bother.
>> >
>> > A bigger question is whether or not we should omit these from the v=
DSO
>> > completely (potentially causing link failures) or replace them with=
 stubs
>> > returning -ENOSYS.
>>=20
>> I see no harm in keeping gettimeofday() in the vdso when
>> COMPAT_32BIT_TIME is turned on, as existing code will call it
>> no matter whether it's in the vdso or the syscall.
>
> We would still always keep them for 64-bit ABIs, right?

Yes, I think we can't easily change that now. It was probably
a mistake to keep them in the generic syscall table after
we dropped them for 32-bit non-time32 targets, so riscv64
and loongarch should have not had these in the first place.

>> Equally, I see no point in having either version of
>> gettimeofday() or settimeofday() when COMPAT_32BIT_TIME is
>> disabled, as clearly anything calling it would pass incorrect
>> data for times past 2038.
>
> Should we also drop the syscalls in these cases?
> We will need to keep settimeofday() in some form to support the
> timewarping call done by init.
>
> Recap/Proposal:
>
> * Keep the gettimeofday()/time() syscalls when they are y2038 safe or
>   CONFIG_COMPAT_32BIT_TIME is set.
> * The vDSO functions always mirror the systemcall availability.

These sound good.

> * Always provide settimeofday(). If CONFIG_COMPAT_32BIT_TIME is *not*
>   set, reject passing any 'tv' argument where it may not be y2038 safe.

This sounds wrong to me now: the case I'm worried about is a 32-bit
system calling settimeofday() based on the value of an RTC or NTP.
The idea of CONFIG_COMPAT_32BIT_TIME=3Dn is to catch this by causing
an intentional ENOSYS error even for valid times, so it doesn't
suddenly start breaking in 2038.

     Arnd

