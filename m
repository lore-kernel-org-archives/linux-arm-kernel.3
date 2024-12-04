Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0098EE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 20:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pTkT1NCxwV2/cGRATL4ar4kOp5miZIhwWMWvCm7vsM=; b=0QfkyRZjouuMW9ckf1Vo6sfsXJ
	4HhPPtjNpJGqx+mDfCUHYnB7BfFQ5l6vMki/GRPCLRvi/SjtQZTaK3j4ooSy6DI7AXzz2w+dZeYaK
	8xWcW+DqclsnKjHEuCD7fP88cSMb1kC/SqYBcHdilGgxnai5gbcMDRpcdFEoGhl2fdxk30etvnwOF
	c60g099CGrZKbB4dHKrqsDRsvMsD54Hkbg9mBqsXA1RPzNBz4NrKVQfmTxvvw0B7m9vPBpo4s7ht+
	PdoBIeLhIZYb9myziT/3kvDFKWNmELccxW79GgzQs9SyYW6Z3JQl9/V1bioHa5pOOwcqDSJY0YB39
	jati8CSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIvj7-0000000Dm19-3UBb;
	Wed, 04 Dec 2024 20:12:01 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIvhw-0000000Dlgx-0GOz;
	Wed, 04 Dec 2024 20:10:49 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 5346B11401BB;
	Wed,  4 Dec 2024 15:10:46 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 04 Dec 2024 15:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733343046;
	 x=1733429446; bh=+pTkT1NCxwV2/cGRATL4ar4kOp5miZIhwWMWvCm7vsM=; b=
	V8CbS3xh5FNtjgrWeOjySBAk1vJuFG688HFl50tjSl6VbPY0T/i2nK5Lu4apFqg+
	HodGcILYXCkE9ivdd3GVt1LtbAl7S4NqcEb3i0McN0fRgV1wUguhOXv3pP/46IDu
	S/TcE6pxXUSTUx6lf3louiB1fNDO33nLkses3iUBnlPn5YVG4jMf6+NzYJ3Kpeac
	VhpdDe9d9r07e75yWX2UqxoD3TanhsiVPaFWW+mMRLKMOlfkZszUmqzvJebvKlZP
	EMg8xMge+LK3mjonh6X9U4nNg7tahX9HGCoEcdtmdjIK6pDSBU3d6rOfdQOXBkHV
	p93Vi9cGucvYj9BKULZN3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733343046; x=
	1733429446; bh=+pTkT1NCxwV2/cGRATL4ar4kOp5miZIhwWMWvCm7vsM=; b=1
	T5uLIvKFHbFWwSSyBZSyZGy/4VpQzV6irTI4Lj9R3lpmmj2OJBvB/xilheAF20K0
	kL7+WUwIwCzSstqaOoq0PBgbZ6oxpOUcD8Rh/1jh2+6PFaNyAaW7VjdYZdKMvYpZ
	8cZlxwjVhHhcvMjJz3pHFsUaHuC1sLhOU9EcUixjcM9OOXw5m3pcS3HXNGbmXvYn
	RpcX+gN4xFbrhX1M1f+v8wA1vLjAa7mdYiCX9vzwKZbvE7mymY+pQtHbl1CdJ61i
	Cnx6HjG1w2Fto3am5COa9kcecWTHqE38RdOiBhQMX39tiOEbDWXiS+X0HrsT9JE6
	VvzxsePPMzQdUcq10NTqA==
X-ME-Sender: <xms:RbdQZwUgaqG7miOJ0jVtMLzh3mfw96Df5YzeXUJ3EG2S1cWPeJPt4w>
    <xme:RbdQZ0k8hjWrJLuufi0fQOqeuAJ0P0Jr_ZUrUC_rPib8T01cVg-xLE4k_fO1hoZMU
    c8vh8vsaZ1FwIzX1XU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieehgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsghruhhnvghtsegsrgihlhhisg
    hrvgdrtghomhdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdp
    rhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpth
    htohepmhgrrhhtihhnrdgslhhumhgvnhhsthhinhhglhesghhoohhglhgvmhgrihhlrdgt
    ohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshht
    rhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgrmhhlohhgih
    gtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    rghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:RbdQZ0aZ_TwgVBRyl-x_CFgxTbgr4p7_o5y19PTRnNfZ0bzz_8SLgw>
    <xmx:RbdQZ_WSGhWFi6uUOODa8gzy8mtWn7k7mYRWmLrNb8ycPTWIT0VQhA>
    <xmx:RbdQZ6l0eAjyi2k-_HoMrE8tBz_T8LMs56dKajZOc9useNI7I64nyQ>
    <xmx:RbdQZ0cezG4w-pIyU7B9dO6pOsy_agfkGBXlCzm2uFRzCMrnAU0YxQ>
    <xmx:RrdQZzeDeeRl9SZ-m0D1fIKJBc0NMLXaDD8-AHUtnwoVnyI_rscrjQvp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D6D442220072; Wed,  4 Dec 2024 15:10:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 04 Dec 2024 21:10:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Mark Brown" <broonie@kernel.org>
Message-Id: <0241900c-3533-42d1-8dc0-df64181e6aca@app.fastmail.com>
In-Reply-To: <1jfrn3l615.fsf@starbuckisacylon.baylibre.com>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
 <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
 <1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
 <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
 <1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
 <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
 <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
 <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
 <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org>
 <1jr06pkof6.fsf@starbuckisacylon.baylibre.com>
 <37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org>
 <1jfrn3l615.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_121048_722202_DC8F7073 
X-CRM114-Status: GOOD (  12.19  )
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

On Wed, Dec 4, 2024, at 18:19, Jerome Brunet wrote:
> On Tue 03 Dec 2024 at 12:15, Stephen Boyd <sboyd@kernel.org> wrote:
>>> 
>>> May I add back the boiler plate code in drivers/clk/meson, similar to
>>> what was proposed in the RFC [1] and propose the generic implementation
>>> in parallel ? It will just be a matter of switching when/if it is approved.
>>
>> Sure. You can make devm_meson_clk_rst_aux_register() use the same
>> signature as I proposed above so that it's a one line patch later. And
>> definitely drop the imply RESET_MESON and depends on REGMAP part. Maybe
>> you can put it in the clkc-utils file?

> * Why drop 'imply RESET_MESON_AUX' ? I would still like the
>   COMMON_CLK_AXG_AUDIO to 'strongly suggest' RESET_MESON_AUX, with
>   dependency problem sorted out.

You can do it the other way round and use 'default
COMMON_CLK_AXG_AUDIO' if you want to tie the two together
with the same effect but avoid the ugly "imply" statement.

I still think it's best to just leave it out. From a user
perspective, the dependency isn't really that the clk
driver needs the reset driver, but instead it's the audio
driver that needs both.

      Arnd

