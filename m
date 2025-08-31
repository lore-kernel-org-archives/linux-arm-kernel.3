Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D735CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 01:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpjfguUsxzt1AxNlUIdMNFoJ4gHI0cFJLJ4SngnFwos=; b=Wu4YBUESc/odL9pk0EEvFtCjBp
	TmHhQ3sQanBY7JmOoz/VGB9p9x8VzvTcfIqTkc5uOIIn642BB3Dz2J+QodU7M7bx1qoKDql9nvHgg
	Y6LnsZsAqJn9wEFsosax5A/mDLkl+hQobkxX7Sf4aws6Pffpur9dSvThx3qOgu9wPEa2s+V6ZWTes
	QDxrYKU9+FQyCT4/i7LGVdZdqvx62CSQYplnSNhdxnBggeflPwlbjRE8a8gYYefqQ/9Yt8mkV3o65
	AaD16BlGSbkKqigV8s4jhX0sYtBNNT6XOJI6IhudKf1m9HFDTS3nXT8sD/kLYLpeaXwKdEvlCHVW5
	K3Tq2zzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usWwV-00000008bm4-1bCs;
	Sun, 31 Aug 2025 01:33:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usWtl-00000008b0X-1Y4B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 01:30:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69D04601A3;
	Sun, 31 Aug 2025 01:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13E7C4CEEB;
	Sun, 31 Aug 2025 01:30:22 +0000 (UTC)
Message-ID: <abac67ba-7aff-4ed2-937e-b483cffc635f@kernel.og>
Date: Sat, 30 Aug 2025 20:30:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: Agilex5 Add gmac nodes to DTSI for
 Agilex5
To: Matthew Gerlach <matthew.gerlach@altera.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 dinguyen@kernel.org, maxime.chevallier@bootlin.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Mun Yew Tham <mun.yew.tham@altera.com>
References: <20250724154052.205706-1-matthew.gerlach@altera.com>
 <20250724154052.205706-3-matthew.gerlach@altera.com>
 <13467efc-7c79-4d06-af1c-301b852a530c@altera.com>
 <a70d060d-f1c8-4147-8f1b-1c7ce6360252@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.og>
In-Reply-To: <a70d060d-f1c8-4147-8f1b-1c7ce6360252@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 8/11/25 10:40, Matthew Gerlach wrote:
>
>
> On 8/4/25 7:57 AM, Matthew Gerlach wrote:
>>
>> On 7/24/25 8:40 AM, Matthew Gerlach wrote:
>> > From: Mun Yew Tham <mun.yew.tham@altera.com>
>> >
>> > Add the base device tree nodes for gmac0, gmac1, and gmac2 to the DTSI
>> > for the Agilex5 SOCFPGA.  Agilex5 has three Ethernet controllers 
>> based on
>> > Synopsys DWC XGMAC IP version 2.10.
>> >
>> > Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
>> > Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
>> > ---
>> > v2:
>> >   - Remove generic compatible string for Agilex5.
>> > ---
>> >   .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 336 
>> ++++++++++++++++++
>> >   1 file changed, 336 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi 
>> b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> > index 7d9394a04302..04e99cd7e74b 100644
>> > --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> > +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> > @@ -486,5 +486,341 @@ qspi: spi@108d2000 {
>> >               clocks = <&qspi_clk>;
>> >               status = "disabled";
>> >           };
>>
>> Is there any feedback for this patch and the next one in the series,
>> "[PATCH v2 3/4] arm64: dts: socfpga: agilex5: enable gmac2 on the
>> Agilex5 dev kit"?
>>
>> Thanks,
>> Matthew Gerlach
>
> Just checking in again. Is there any feedback on this patch (v2 2/4) 
> or the next patch (v2 3/4)?
> https://lore.kernel.org/lkml/20250724154052.205706-1-matthew.gerlach@altera.com/T/#m2a5f9a3d22dfef094986fd8a421051f55667b427 
>
> https://lore.kernel.org/lkml/20250724154052.205706-1-matthew.gerlach@altera.com/T/#m3e3d9774dbdb34d646b53c04c46ec49d32254544 
>
>

Applied!

Thanks,

Dinh


