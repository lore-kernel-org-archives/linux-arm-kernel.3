Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB482F9935C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyjeDLRihWXGnG8DMErcEW86rv0ADdgt5VkUA9RV/pk=; b=DfXBQhXS4R9HjsGuDNvmasO0Kx
	hcDWocvkYNvVbWMLWeeMdJ0xmMdgaOLEiSiqwBTCQWq8YYypMD9el98uc2044abm5cziSzaL04zBf
	gLfyh0TQjnIB9092EzLhTHlijCiYbm4NUID564M4Ofz6ZjVBFCgLW0GBoDFurpnhirNBl7mQ7NDoR
	Qm/q5XWcpjhF/6szHWDWaise84GUuPeZLBTMusxO6fm+9Wcz/WN807AxbnUPK8KZhvYCVax7uyNt/
	rtSzFQZ3M43vH5P3r4ByUMj+1y4dhqiwyXRvSE1i4/ZbPaGMPtwGnZ1tViOYWmnbAMTrAx9XHl4WD
	hVxRvlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqJZ-0000000BNlz-0J2K;
	Thu, 23 Apr 2026 09:25:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqJX-0000000BNl9-2wYJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CD7660120;
	Thu, 23 Apr 2026 09:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC8FC4AF09;
	Thu, 23 Apr 2026 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776936338;
	bh=j40Grx3Iw72ongnTHVdo+wYxZ8h6ryWwnf1Rp6Vy1Nw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=cFSR0LASVwgxdx1V4n6qwnC5C7auOyrbbL2VEsDoiN4wnEbaWC28kEYSfuBmSqQQI
	 FbPvHo7mEVlpwLLEayXXosAbYGYanEmzh6vGKUedXPZNqmkW5xBum/46Uxx7iwrVnD
	 P2ULoZ96RASLBMR0I4FSetotMvSwbekhfxyj+VFHJ/pKO1e/1JTPjVw0vdTiF4g+i2
	 Q2evh/QKsWxzFqZAeZ9zND+yWXTaufGS2+k6IybxnupBZ2J0fwzroVoUEjdqiGFmN1
	 iM2TVFBehC2cJHfkk0ctrBqxvQ90xVTqTdOMNjLHr80ewxLu3lvxQl3MOxaFSypeV0
	 z1pMTijkorHEg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8DFD9F40069;
	Thu, 23 Apr 2026 05:25:37 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 23 Apr 2026 05:25:37 -0400
X-ME-Sender: <xms:keXpaQOj7C4w99Xv9eyZshPoKrm5xTUsh5lOlWgqJRq6su4mde82_g>
    <xme:keXpaRzuiFFDJgYWXPzG-1ZbHMrGw04dKiSDzwKjOSaBRa7huDHcFmU9B-k7OI743
    OELH-T1Gcz0DaveDT320zC45PKMjKnrYNE6nD06VReS4F4AOFZBFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiieejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieej
    fedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtg
    hpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehlrdhr
    uhgsuhhstghhsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgvrhgsvghrthesghhonh
    guohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopehlihhnuhhsfieskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepthhhohhrshhtvghnrdgslhhumheslhhinhhugidrug
    gvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmih
    gtrhhotghhihhprdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrseht
    uhigohhnrdguvghv
X-ME-Proxy: <xmx:keXpaSk8od9xeJWWTpDQyTJuu4TQscRU5at8_dtsJNBYnoKGfuwrAA>
    <xmx:keXpaR9FfkLYLKC3ZcEUprrJWpfFPJfIIw-mGwd-fUNSdrOuqd3ZtA>
    <xmx:keXpaQJWCibDVS256fWxB5dF4Tb5FUlb1QRNHUGvbaXfnz8fMq04JQ>
    <xmx:keXpaWjp7tN3KeYqNV7E174MSOhlIgkDj3l0izlXyUUFUlcxbYKZHg>
    <xmx:keXpac_yPLsU7PbnMcMz8O4iutEn-_MPGDtGYGpkIUeDesWAia5gMofo>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 50E81700069; Thu, 23 Apr 2026 05:25:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 11:25:16 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Lothar Rubusch" <l.rubusch@gmail.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "Thorsten Blum" <thorsten.blum@linux.dev>, davem@davemloft.net,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, "Linus Walleij" <linusw@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <a82278e5-9b5e-4fb9-9e7a-800ef2898ec5@app.fastmail.com>
In-Reply-To: <20260422210936.20095-1-l.rubusch@gmail.com>
References: <20260422210936.20095-1-l.rubusch@gmail.com>
Subject: Re: [PATCH v3 0/3] crypto: atmel-sha204a - multiple RNG fixes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi Lothar,

On Wed, 22 Apr 2026, at 23:09, Lothar Rubusch wrote:
> When testing the RNG functionality on the Atmel SHA204a hardware, I
> found the following issues: rngtest reported failures and hexdump
> reveiled only the first 8 bytes out of 32 provided actually entropy.
>
> Having a closer look into it, I found a (small) memory leak, missing
> to free work_data, miss-reading of the count field into the entropy
> fields and parts of the 32 random bytes staying 0 due to reading the
> slow i2c device.
>
> The series proposes fixes and how fixed functionality can be/was
> verified. Executing rngtest afterward showed a decent result, due
> to the i2c bus a bit slow.
>
> All setups require selecting the Atmel-sha204a as active RNG.
> $ cat /sys/class/misc/hw_random/rng_available
>     3f104000.rng 1-0064 none
>
> $ echo 1-0064 > /sys/class/misc/hw_random/rng_current
>
> $ cat /sys/class/misc/hw_random/rng_current
>     1-0064
>
> Testing RNG properties currently shows problematic results:
> $ rngtest < /dev/hwrng
>     rngtest 2.6
>     Copyright (c) 2004 by Henrique de Moraes Holschuh
>     This is free software; see the source for copying conditions.  There is NO
>     warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>
>     rngtest: starting FIPS tests...
>     rngtest: bits received from input: 1040032
>     rngtest: FIPS 140-2 successes: 0
>     rngtest: FIPS 140-2 failures: 52
>     rngtest: FIPS 140-2(2001-10-10) Monobit: 52
>     rngtest: FIPS 140-2(2001-10-10) Poker: 52
>     rngtest: FIPS 140-2(2001-10-10) Runs: 52
>     rngtest: FIPS 140-2(2001-10-10) Long run: 52
>     rngtest: FIPS 140-2(2001-10-10) Continuous run: 52
>     rngtest: input channel speed: (min=7.631; avg=7.804; max=7.827)Kibits/s
>     rngtest: FIPS tests speed: (min=32.273; avg=32.701; max=33.056)Mibits/s
>     rngtest: Program run time: 130177956 microseconds
>
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
> v2 -> v3: Removal blank line, rebased
> v1 -> v2: Removal of C++ style comment (I saw it too late, sry for that)
> ---
> Lothar Rubusch (3):
>   crypto: atmel-sha204a - fix memory leak at non-blocking RNG work_data
>   crypto: atmel-sha204a - fix truncated 32-byte blocking read
>   crypto: atmel-sha204a - fix non-blocking read logic
>
>  drivers/crypto/atmel-sha204a.c | 60 ++++++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 21 deletions(-)
>

Thanks for the report and the fixes. However, I'm not sure you are entirely
on the right track here. I managed to fix the rngtest issues that you report by
making the changes below. As I already replied, I think it would be better to
propose this as a standalone patch, and backport it to stable.

The remaining changes are somewhat debatable IMO: the leak is not really a leak,
so I'd like to understand better what you are fixing here. The command field
changes seems completely misguided (unless I am missing something)



--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -47,8 +47,8 @@
 
        if (rng->priv) {
                work_data = (struct atmel_i2c_work_data *)rng->priv;
-               max = min(sizeof(work_data->cmd.data), max);
-               memcpy(data, &work_data->cmd.data, max);
+               max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
+               memcpy(data, &work_data->cmd.data[1], max);
                rng->priv = 0;
        } else {
                work_data = kmalloc_obj(*work_data, GFP_ATOMIC);
@@ -86,8 +86,8 @@
        if (ret)
                return ret;
 
-       max = min(sizeof(cmd.data), max);
-       memcpy(data, cmd.data, max);
+       max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
+       memcpy(data, &cmd.data[1], max);
 
        return max;
 }

