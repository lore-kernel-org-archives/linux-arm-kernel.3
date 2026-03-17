Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E30AF33821
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrrhHY9vkr1DtkvlKZDIAM8/07CcFbUVo4DxuLdzU/Q=; b=KEJxmAZnraR6VNsPOW9cjtWJ4F
	pI5ZuNZhPN680pgkEp4qI4w5RoxPOzZjxBp41sbg16yBfGIm1XxFVj3keic5Oij/bzxJrSToYCL5g
	DgjGhAtAfNbScF6VvIVj1Gw03HOwYHQviAyPovCG+Kn5Qavb1Va8SUc6mAw8KNkkZ5X6SVeQN58nO
	5Gr38CO7MYkAqYskCpnPQwI/xpwJVAvTKA0K20qKqWDDMKk2p+5AKQbKSKM2TkSOfrCtCCM46kLLW
	bcw1MnLIGzbRmC4pXNtNMd1ZTVo7JKlUkSj9d0w1m/955uaAgmNEAnXNeRoV7yHep6MUa4ASpDwbo
	yDMrLIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QkP-00000005sBM-10ey;
	Tue, 17 Mar 2026 09:29:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QkM-00000005sAK-1J2R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B080D40633;
	Tue, 17 Mar 2026 09:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE5BC4CEF7;
	Tue, 17 Mar 2026 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739793;
	bh=in4VyGB0AnZoJApG7MiVWwveHRL9EwDvdLfCcNsaZGU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i39UqYTFvobLTkeCKufdsA1I3JxL/zcQTHqm6KuPXpZHqGFkThQJ9YKm/HgZnImIW
	 Ua5xiZPdb4qzSJpv+0FxyougBPylpOM64SdwSaQDJA1QDIdvATRsr7esppoLrDfeap
	 LF4uPV09LG9A31CZZ9CTw3yZdhoWkHVqlBH5HcwGc4s15t0HvtZZm2Z0GBDHYqePzs
	 P4H6KFnx0R7aHj9XsO9yl0h7Uog2UbK7E9Qc9hIWNIpqnYe/ou3RojZTy+ShDXAnzg
	 dNVM+UOqQG4pTCE8YqZjYsMd7RmncJTKks4a1oMuCfOKkCocOQ2OskTtc/dQDqPRiJ
	 jC85qAyB4hKuA==
Message-ID: <bdefa3d7-353c-4aa1-a013-685b46773fe7@kernel.org>
Date: Tue, 17 Mar 2026 10:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 3/4] Renesas DT binding updates for v7.1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <cover.1773399669.git.geert+renesas@glider.be>
 <cover.1773399673.git.geert+renesas@glider.be>
 <20260314-quick-gray-saluki-0f96ff@quoll>
 <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_022954_400564_1EC52ED7 
X-CRM114-Status: GOOD (  27.02  )
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

On 16/03/2026 09:51, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> Thanks for your comments!
> 
> On Sat, 14 Mar 2026 at 12:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Fri, Mar 13, 2026 at 12:12:59PM +0100, Geert Uytterhoeven wrote:
>>> Renesas DT binding updates for v7.1
>>>
>>>   - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
>>>     SMARC SoM and Carrier-II EVK boards.
>>>
>>> ----------------------------------------------------------------
>>> Biju Das (2):
>>>       dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK
>>
>> This is DTS branch patch.
> 
> It is a DT bindings patch.

I speak about branches. You quoted submitting patches in DT, but that is
implied. I already know it, I was making changes there and I already use
that document as arguments in multiple discussion, so please assume I
know it and my comments reflect that knowledge. I actually assumed that
you also knew it.

DT binding patch should go with the patch using the binding. So DT
binding for board is clearly a DTS branch patch.

> 
>>>       dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC
>>
>> This is drivers. Splitting it into additional branch is not making it
>> easier. I don't know where is this supposed to be merged. I will take it
>> to drivers, but in the future, please do not put DTS bindings into
>> driver bindings.
> 
> This is also a DT bindings patch.

But for which code? Driver or DTS?

> 
> DT bindings are soft dependencies for drivers and DTS.
> DT binding definitions (I don't have any this time) are hard
> dependencies for drivers, DTS, and examples and DT bindings.
> Arnd merges dt-bindings PRs in the soc DTS branch.

Then this should not be a separate branch, because:

1. No benefits - you did not solve any soft dependency. Your DTS branch
is non-bisectable from dtbs_check point of view and you as maintainer of
that tree should try to make it bisectable, meaning: "bindings go before
user" like explained in what you quoted further.

And please also read rest of submitting patches, although it is in part
for "submitters" but explains the concept:

" 5) The Documentation/ portion of the patch should come in the series
before the code implementing the binding."

"6) Any compatible strings used in a chip or board DTS file must be
previously documented in the corresponding DT binding file"

Previously means "before", so your DTS branch is failing above.

2. It is additional effort to handle this, because instead of merging
one branch, I need to merge two.

> 
>> See also submitting patches in DT dir.
> 
> So the second commit is subject to II.3:
> 
>   3) For a series going through multiple trees, the binding patch should be
>      kept with the driver using the binding.
> 
> In this particular case, I could have included it in my drivers branch.
> Where do I put SoC-specific DT binding changes that are not picked
> up by anyone else (I don't have any this time)?

What is "SoC-specific"? You put the DT binding with the user, that was
always the rule and that is implied by submitting patches. If you do not
have any user, why would you pick that up?

Best regards,
Krzysztof

