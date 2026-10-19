Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZTuFMFli;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=f04JsVaO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s51N6XNe2djMI4gMavRjcuP3fUqvxRFw7XI3t+UeSdg=; b=ZTuFMFli1gH0RSdM455G5Xbujp
	oE1TV3O4jwmIM1OxZTyPDVREyhaavuCXq1Rj8p8UhXtbgjxa3hiolxyj1l2u6mgqw6yoskT9vfWtF
	kbofkoT47fjcO/uc48Znv89tH79SdyN6OR3gYXVl0Hr6fnNx01aVf1HimnqEOb4swj+o2DiYJh1cQ
	SyjOn7GfgZq1Bb8RmI4RrFMYTXkQpDVtYFAPAGo456uO7T0JtD233CrWHiV/HCpJENCMGvpFY7piJ
	MCH2sAOoZVzJ+RT6LO7HxQNzcyTyeW8v03snD+vXL39SreY3kfG+gU6iyqv4heEs9EXS7b8vc+joV
	OYFHA/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvjB-00000008Td4-0YaX;
	Mon, 19 Oct 2026 22:21:09 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvj8-00000008TcZ-2yP7;
	Mon, 19 Oct 2026 22:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1792448456; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WrrXJ1YWBO5A0kDwu9XrscKsAznjiY++dqm22cz5TXcJnQBDaTlCmJm5rqnjRXoFsbkPZzL8Kp6vpowXk5RkwsJNvZIlS5PI47Gu+0ilGlvm5jJ9Ff6P3Ssr2mmEYcntRjhpEPwGspb4JjK5Xi2Blfx8Y4aYGiys/aL4XpGd/IY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792448456; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=s51N6XNe2djMI4gMavRjcuP3fUqvxRFw7XI3t+UeSdg=; 
	b=nDtccBpIf+SsKGYYGImeYiugxqa/fA7XlI7Pdn9SNfqGz0e9UJ4Y+BBfaPDwRIP832btLtYcUpDFO2FCvm9nkX0uHgxFBed2ZrqemvY8fgGuhTkY83qcVl3usntWPRJNF6kIlRR3JxBot7McAG32BOiIj7u8kUVVREQsa30PlIc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792448456;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=s51N6XNe2djMI4gMavRjcuP3fUqvxRFw7XI3t+UeSdg=;
	b=f04JsVaO23ITcR3e/y7REbigorpmjJrcP71oHq1fSWOlg8BuYCdLXWIbydPOzQ4e
	kxEXdx7SMniTwzyHtibN6IVwMhrHgpn/sc1Cuh0CgcLaVHTTv6QNypaAv7z1PRbJlfP
	F4Cdgpt/FqSEiiTrTwUQ386cQ+Soyd5XNs8/LPuo=
Received: by smtp.zohomail.com with SMTPS id 1792448452872579.0876982000046;
	Mon, 19 Oct 2026 15:20:52 -0700 (PDT)
Message-ID: <73ef0d06-75c5-4c10-b4c3-c7b3c07a1e18@collabora.com>
Date: Tue, 20 Oct 2026 00:20:47 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: Rob Herring <robh@kernel.org>, =?UTF-8?B?5qWK5pm65oiQ?=
 <jason98166@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
 <20261016140115.GA1798470-robh@kernel.org>
 <20261017-gainful-goldfish-of-climate-bef863@quoll>
 <CAPwA33+bR1BF9KeA9my07Yz7gXW7TXq8EPhwQ4GvHMSFDk+uWw@mail.gmail.com>
 <20261019150631.GA265407-robh@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261019150631.GA265407-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_152106_844605_AE631624 
X-CRM114-Status: GOOD (  28.46  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

On 10/19/26 17:06, Rob Herring wrote:
> On Mon, Oct 19, 2026 at 04:15:03PM +0800, 楊智成 wrote:
>> Hi Krzysztof, Rob,
>>
>>> Existing OS should ignore surplus cell if the driver is coded properly.
>>> Same as adding new properties or new front-compatible.  The question is
>>> how the existing driver behaves?
>>
>> As you pointed out on 5/8, the xlate checks args_count != 1. The DC-PHY
>> driver was merged in v6.15, so every kernel since 6.15 fails on a second cell.
>>
>> 1. Keep the second cell. Add the patch as follows:
>>
>> - if (args->args_count != 1) {
>> + if (args->args_count < 1) {
>>     dev_err(dev, "invalid number of arguments\n");
>>     return ERR_PTR(-EINVAL);
>>   }
>>
>> + if (args->args_count > 1 && args->args[1]) {
>> +   dev_err(dev, "only the transmitter is supported\n");
>> +   return ERR_PTR(-EINVAL);
>> + }
>>
>>   With Fixes: and Cc: stable, the stable kernels maintained at that
>>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
>>   dts, and the receiver fails cleanly instead of getting the transmitter.
>>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
>>   It goes in with the series, since two-cell dts only exist after it.
>>
>> 2. Use a flag in the upper bits of the existing cell, as Rob
>>     suggested. Existing kernels are not affected, unless a board enables
>>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
>>
>> I will write the impact clearly whichever  approach is selected in
>> the related commit messages and the cover letter.
>>
>> I think the cell approach is easier to read and more symmetric in the
>> long term,
>> but it breaks more. Which one do you think is better? Thanks.
> 
> I'm not a user of this platform, so I don't care. Up to the platform 
> maintainers to decide if breakage is acceptible. You just need to 
> document the issue in the commit message.
> 
> Rob

It's a bit of a pickle, all this.

I gave it some more thought. In the end this is an IP block with two
PHYs. No more, no less. One cell is sufficient to address those, and it
could be 0 for the transmitting PHY (DSI, display) and 1 for the
receiving PHY (CSI, camera).

Of course the two PHYs can operate in either DPHY or CPHY mode. The
phy-cells have been (mis?)used to select the proper mode of combo PHYs,
and this principle has been applied here too.

However, we have the special situation here that the mode can only be
changed for the complete IP block (and thus for both PHYs at the same
time). As Bryan points out, we need to check and complain if the PHY
mode is not set to the same value for both PHYs.

I suggest using a property
    samsung,cphy-mode;
(name to be bikeshedded) that sets the complete IP block into CPHY mode
(DPHY being the default) to distinguish between the modes. Since both
modes use a different electrical interface, this is clearly a hardware
thing and thus suitable for device tree.

Then, we can address the two PHYs with the help of the already existing
phy cell (without any bitflag tweaks to the value).

The sole drawback is that we need to accept the PHY_TYPE_DPHY and
PHY_TYPE_CPHY values that some OS in the field might pass. (For Linux,
it should only be the former.) And we need to handle those values
correctly. But I think this is not more painful than the other
approaches. At the same time, this design seems to be the most correct
one IMHO.

What do you think?

Best regards,
Michael


