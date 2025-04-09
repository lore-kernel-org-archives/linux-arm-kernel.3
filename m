Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62E7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33jataLKOMrDl7oW0kqbiVVzQKavk3L6wvJAXox3arE=; b=T42EVCGKjQWZeHfg2ph19opAVs
	DKNxOdKFO2VKLmZzi00M073oIxAAHvqJ9BwFIkkLXzxt43VxbSGjmkldgs4b9HCAca4xfp4DaA5ZE
	jJ26gyIAPcRh0OIs/XY1Afeso7L7OEWXdy8SmFxFfAVVSg+3DFodDeImCzAKRaYPAAohmhGGKOo1P
	BgG2by/XYQreeunoA5FZPMGMP+U7ABlaIgx1OWFb/73amrJlHWmJA+tr4inMw3UunkzLrLEoFgLH9
	YW4vLeM0NWHZ5MSEJYo8te2sijaxElQxNxRP8g6Nax9I9tsl2or7nqC5G3s2pI5E9AzmIvbucI3sM
	AwMhc8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YCr-00000007sBv-05XG;
	Wed, 09 Apr 2025 16:23:17 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Y2t-00000007qeK-3Zvi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:13:01 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailflow.stl.internal (Postfix) with ESMTP id BDFB91D40378;
	Wed,  9 Apr 2025 12:12:57 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 12:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744215177;
	 x=1744222377; bh=33jataLKOMrDl7oW0kqbiVVzQKavk3L6wvJAXox3arE=; b=
	Sf9N7x9+592spj2w4NNDK8DtL3spi5xwI2nbpr/pMDEQ7Lenz94gJddRGkxKPJCd
	dxmat3ZDeyFSH/Z7Dl6Jp9DfbjS8kEY9kJN1riq4740H7cNcxmnBTaplX+hyvRjE
	DkA7ealGvq25awf+4agXajLLLcPGVDQvYHRQFbe8lAJGmAllko4J/11Kfnip48dT
	xlx/Bk/ZiK3aPWlvPbxMoqZoln02HfAbvScwfwtzlTNLSFOWcJymaz9jX/ZyaVjG
	0E6DiN7uJmFOLhCDjt6zSog9WoffVL8fGYYaCz/RMKuOrtz1YFKwGpDJ4Iozjh9J
	szqvIOSXe0zIGR100jkiOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744215177; x=
	1744222377; bh=33jataLKOMrDl7oW0kqbiVVzQKavk3L6wvJAXox3arE=; b=w
	4jf9RrYg4MM5owPrOa4DT6jv3N1l91Yu4GO1QlERQ+SMDVQAyKmHGZiX+Db3faDE
	IhNLd3+8fbLy7AspKB+5YG6/wIQY6Xmc6aMqFiw+zvJnZb6rNOOCBGdhyus+uFZn
	P8A9+xez6PLjbt+ieWYeC2Cz9C0krrpgg17oF0SMkYjWkC/Mnr9VU1GscuUhfVYG
	0kqBdl4/6vPwcdltUJzuNftlFIrsY8ttt6MUcOlz0oPDLCkOmB5SGotmrzrDzsvl
	sYOXaUt89J21qTGkdHMkBzUDAW3Ke7+Pv2RA2759ZjHnucWUh3SjPX6oBGNIqYCI
	uHeaYM6uTncr0j6e9WCRA==
X-ME-Sender: <xms:h5z2Z8KHSoVXEffdwRcJgSRi8DSBQzY1RtX891upV9s3lgmUI8fwmw>
    <xme:h5z2Z8I1gmGW-Ei2-vrmdTZioXTfQxxD2AoXWBL3t2PIMur3C7gcvmPQ5mTCqkkTl
    09xfb8_7etFlMG9lBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeigeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheptghhrhhishdrphgrtghkhhgrmhesrghllhhivgguthgvlhgvshhishdr
    tghordhniidprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpd
    hrtghpthhtoheprhhmkhdokhgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhr
    tghpthhtohepughirghnuggvrhhssegthhhrohhmihhumhdrohhrghdprhgtphhtthhope
    hnihgtohhlrghssehfjhgrshhlvgdrvghupdhrtghpthhtohepghgvvghrthdorhgvnhgv
    shgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegvsghighhgvghrshesghhoohhglh
    gvrdgtohhmpdhrtghpthhtoheplhhiuhihuhhnthgrohduvdeshhhurgifvghirdgtohhm
    pdhrtghpthhtoheprhhurghnjhhinhhjihgvsehhuhgrfigvihdrtghomh
X-ME-Proxy: <xmx:h5z2Z8uH9UIIzQnIliicFwHgsOXHjzdCs4Ex5QgLPr22gZQc2YCcYw>
    <xmx:h5z2Z5afkpjYXabgkSsHiAciTMBD6ajkQSbDxosFYTcLBn6CkU3Qgg>
    <xmx:h5z2ZzZ7WiCmp4sZvdoocklgHZiXZXbt_i2LvM6eWrCg8y2RcF5eRQ>
    <xmx:h5z2Z1CW5_uxueBOV24t9UGGki1NZ76N5o6InHz9Kk6Y6SHvEjWyHw>
    <xmx:iZz2Z3z_uLxm7F_ZG070Y08vLseOaj9es3758GkaThsd27sU5h0BuLLi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BBAC22220073; Wed,  9 Apr 2025 12:12:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T1a2df1155f45051f
Date: Wed, 09 Apr 2025 18:12:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ard Biesheuvel" <ardb@kernel.org>, "Kees Cook" <kees@kernel.org>
Cc: "Chris Packham" <chris.packham@alliedtelesis.co.nz>,
 "Doug Anderson" <dianders@chromium.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Andrew Davis" <afd@ti.com>,
 "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Xin Li" <xin3.li@intel.com>,
 "Ruan Jinjie" <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
 "Eric Biggers" <ebiggers@google.com>, "Yuntao Liu" <liuyuntao12@huawei.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Dave Vasilevsky" <dave@vasilevsky.ca>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Message-Id: <b5a57fd6-ceae-45b7-b8eb-1ea85001dd45@app.fastmail.com>
In-Reply-To: <CAMj1kXHks1_eC=cAmkPC45deMp3_VdxckjyRoWvMovdBekg2bQ@mail.gmail.com>
References: <20250409160409.work.168-kees@kernel.org>
 <CAMj1kXHks1_eC=cAmkPC45deMp3_VdxckjyRoWvMovdBekg2bQ@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: Remove ARM_SSP_PER_TASK plugin
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_091259_954625_0B82C5D8 
X-CRM114-Status: UNSURE (   8.72  )
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

On Wed, Apr 9, 2025, at 18:08, Ard Biesheuvel wrote:
> On Wed, 9 Apr 2025 at 18:04, Kees Cook <kees@kernel.org> wrote:
>>
>> As part of trying to remove GCC plugins from Linux, drop the
>> ARM_SSP_PER_TASK plugin. The feature is available upstream since GCC
>> 12, so anyone needing newer kernels with per-task ssp can update their
>> compiler[1].
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Link: https://lore.kernel.org/all/08393aa3-05a3-4e3f-8004-f374a3ec4b7e@app.fastmail.com/ [1]
>> Signed-off-by: Kees Cook <kees@kernel.org>
>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

I was going to send the same patch and double-checked it to
make sure they are actually identical.

        Arnd

