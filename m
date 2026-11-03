Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8413D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3mThu25b;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=J/JdBhFu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7ulnvN9VsCbKJ/5rQ+fv57lUtGef7Rza8nTzYqc8E6E=; b=3mThu25bTf+Mjk
	psNyKq3IFMaeu+fWqwh43VKtfocB7vXpJpbtU+TyE3Y3s4G4oUxbJ02tgKcHK/NZOJExSBAv9AK28
	cgiSllTsE1/khuvyrJ13P8SJigxJJaQNNJt89M6ZZPm9JSL7+G1dOYaIZrEYe5S7W4PZz1Stmbe6/
	AcJHTmuPhxu+c44+k+G5G57LiFxoU0NgFuGgEcdpAdeOUnFhmK0V20NRor0Erf+S7n0tp+kpJvUK7
	gGpBf2Mll21GP/4ZB+3yPle84a1Y1+ABvQ7CiduxQDVJ72uM054jYqXwiLO+Sh3FKUfRz3XaW7aIF
	f/6OyS1kIMVBXjlwIxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEMm-00000002VvN-3Zvy;
	Tue, 03 Nov 2026 13:15:56 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEMj-00000002VuU-3biK;
	Tue, 03 Nov 2026 13:15:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4BB4273BB9;
	Tue,  3 Nov 2026 14:15:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793711745; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7ulnvN9VsCbKJ/5rQ+fv57lUtGef7Rza8nTzYqc8E6E=;
	b=J/JdBhFuB1Lc17BCzKASBTrGoMuC5xDlVYh6Z005FWsIQ+l00oHjV8LmTml6Kl6fMP66+r
	9Ix+RVrpBG5C66PfhmX3my5GYaaiwTymlM905oI51K2DG/IM1Giu+kqxzgGmAyvLRTZaTd
	YhGNyGdgwdqVU+NquzGUQ5z1PddP5LFTCzJCtKlnda9DAvS2RXzaJI6z4dGzMC0HwNIKLB
	6erpbH0qh32nlxnCirtPNjxVTk9h6wLybxcxZTWN18SszPGE0wzB/fgI+e80oqgeuV3lK9
	D7szzMK5mhi79mzbP61lfXdWDkH5IuxSzDXR4mSZeGubb6ptkSueuvWsfj8C5Q==
Message-ID: <39cb446e-b667-4766-bd79-2635eb36166c@cjdns.fr>
Date: Tue, 3 Nov 2026 14:15:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 6/7] dt-bindings: net: dsa: mediatek,mt7530: add EcoNet
 EN751221 switches
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-7-cjd@cjdns.fr>
 <20261103-soft-lyrical-squid-c5a108@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20261103-soft-lyrical-squid-c5a108@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_051554_254161_84EF9E53 
X-CRM114-Status: GOOD (  22.83  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Thanks for the review.

On 03/11/2026 12:08, Krzysztof Kozlowski wrote:
> On Thu, Oct 29, 2026 at 06:42:01PM +0000, Caleb James DeLisle wrote:
>> The EcoNet EN751221 MIPS SoC integrates an MT7530 switch memory-mapped
>> in the SoC register space. It is similar to the econet,en7528-switch
>> except that ports 0..3 are 10/100 only, port 4 has a gigabit PHY, and
>> port 5 has no PHY, but is in some implementations connected to a
>> downstream MT7530 multi-chip module via a TRGMII link.
>>
>> The downstream MT7530 is similar to the MT7621 multi-chip module and
>> has all gigabit ports.
>>
>> Add the econet,en751221-switch compatible with the same constraints as
>> the other built-in switches and also add the econet,en751221-gswitch
>> multi-chip-module switch whose port 6 is configured as a DSA link port.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 43 ++++++++++++++++++-
>>   1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> index f98b9113ad12..011c94ef9554 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> @@ -29,6 +29,12 @@ description: |
>>     and the switch registers are directly mapped into SoC's memory map rather than
>>     using MDIO. The DSA driver currently doesn't support MT7620 variants.
>>   
>> +  EcoNet EN751221 SoCs have a memory mapped MT7530 with 3x 10/100 PHYs and 1x
>> +  gigabit PHY. Some EN751221 chips such as EN7513G and EN7526G have a multi-chip
>> +  module implementation of the MT7530 as well as the on-die switch. In these
>> +  packages, the multi-chip module is connected to port 5 of the on-die switch
>> +  via a TRGMII link and allows for 5 gigabit ports.
>> +
>>     There is only the standalone version of MT7531.
>>   
>>     Port 5 on MT7530 supports various configurations:
>> @@ -109,6 +115,14 @@ properties:
>>             Built-in switch of the EcoNet EN7528 SoC
>>           const: econet,en7528-switch
>>   
>> +      - description:
>> +          Built-in switch of EcoNet EN751221 SoC
> You can drop, pointless description, repeats the compatible.


Perhaps reword "On-die switch of EcoNet EN751221 SoC" to avoid confusion 
with MCM switch?


>
>> +        const: econet,en751221-switch
>> +
>> +      - description:
>> +          Multi-chip module gigabit MT7530 in EN751221 SoC
> Keep it in one line with description. No need to inflate it even more.


OK


>
>> +        const: econet,en751221-gswitch
> That's almost the same compatible, which makes me wonder if you describe
> the same device twice. Same device, same compatible.


Well, these are both MT7530 based, but one of them is on-die with the 
SoC and the other one is an MCM so for the driver they are very 
different - they're even loaded by different kmods. I think since one is 
MMIO and the other is MDIO, using the same compatible won't cause a 
driver problem - but I don't know if it's best practice to smooth over 
such a difference or not. Your advice here would be most appreciated.


Thanks,

Caleb


>
> Best regards,
> Krzysztof

