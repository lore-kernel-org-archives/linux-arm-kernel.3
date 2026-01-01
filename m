Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99452EEEC1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 23:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=US7g0fT2WrFWVNstxMf1pZ+HNijOdD3MvUsgtVB6Eww=; b=YWrSsF4kU4EJUNfVqYHp4rHZzQ
	aWU8s6SOwf+UdsYtWHDT2+Zvad7w2matzCo5EseGfv2/y8aTyeHale4gj9WrMjjjVk0YRBcjjjE2u
	a6cuQFnw4Qu9q2LuZxB+traTOKoVBFAHAWW02esx6olc6FyC3MHoF7VM93XfTBrMBuNKJnKZYsHyf
	s8kFFbLEGadbbB852RpBhnCj50hblVtQNMcHjcqtfThwoacvPZOOGk2SnR1osKltQoqmwmk8956gc
	bz518teRMDBd+cu3edvw5lRSFt93yiN7To+L3pslyAe3fV3dV2Q2aVtLKGPbEDvL/XvoZYQRLWewz
	T/+RDyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRkk-00000007dFl-3t6Z;
	Thu, 01 Jan 2026 23:06:46 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRki-00000007dFD-0NkV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 23:06:46 +0000
Received: (wp-smtpd smtp.wp.pl 27093 invoked from network); 2 Jan 2026 00:06:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767308797; bh=US7g0fT2WrFWVNstxMf1pZ+HNijOdD3MvUsgtVB6Eww=;
          h=Subject:To:Cc:From;
          b=cG6qI1vN+bCCYwiSGOjPS9N+FTsDwrZ5n5qwudU3dXzot8rEQPURSiI52gS1EJSXy
           4F/9AqI6COotC7x+CXH/hWRJzLcIHEtdS2a8n9Uyv4vd82yfB45K5cUcuXWxBQnPvQ
           ldcXtbNgSTrpJp/by3YjkOk4gPTmREIZ6IvRlReZfrrdqfKvg8XKQ7XikEfJ4byx53
           7oTFoz+WfFBBw5Clip9hJn+GRSZSMsCA3ykBgyT92sx+fkwoocytIGuWP78wfMxqqB
           72oBRnvkxJm0VjMeWbk0U2PSYUqJqpzsJFXitfYQ8/gdzgFGE7+mw4xTR2vK7sjj5K
           pWLKjC7SvUoEA==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO [192.168.3.246]) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <sergio.paracuellos@gmail.com>; 2 Jan 2026 00:06:37 +0100
Message-ID: <53dc4786-a6c3-471a-acc4-67486b8cdea9@wp.pl>
Date: Fri, 2 Jan 2026 00:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mips: dts: ralink: mt7621: add crypto offload
 support
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: ansuelsmth@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 chester.a.unal@arinc9.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, tsbogend@alpha.franken.de,
 angelogioacchino.delregno@collabora.com, linux-crypto@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, benjamin.larsson@genexis.eu
References: <20260101172052.1862252-1-olek2@wp.pl>
 <20260101172052.1862252-2-olek2@wp.pl>
 <CAMhs-H_iN7pWsis2HbeJ-xr+9JoMa+EF-+7z9e21DJ1dyNNtuw@mail.gmail.com>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <CAMhs-H_iN7pWsis2HbeJ-xr+9JoMa+EF-+7z9e21DJ1dyNNtuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: 2fbea3525d83cf2a46a1adb43f9685ce
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [oVr0]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_150645_134973_274BE98F 
X-CRM114-Status: UNSURE (   7.04  )
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

Hi Sergio,

On 1/1/26 22:46, Sergio Paracuellos wrote:
> AFAICS, the crypto engine for mt7621 has also a clock gate[0] and a
> reset line[1]. These two are not present in this binding.
>
> [0]: https://elixir.bootlin.com/linux/v6.18.2/source/include/dt-bindings/clock/mt7621-clk.h#L36
> [1]: https://elixir.bootlin.com/linux/v6.18.2/source/include/dt-bindings/reset/mt7621-reset.h#L33

Will add reset and clock gate in the next iteration. It looks like
the crypto engine in AN7581 also has a clock gate[0] and reset line[1].
Just not sure if these definitions are correct.

CC: Benjamin Larsson

[0] https://elixir.bootlin.com/linux/v6.19-rc3/source/include/dt-bindings/clock/en7523-clk.h#L12
[1] https://elixir.bootlin.com/linux/v6.19-rc3/source/include/dt-bindings/reset/airoha,en7581-reset.h#L45


