Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F38DC54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHMHe8DXYFbv7HkrjiopSzw/zJOF/JWl21dsP0Poq2M=; b=IBNDMOn6UEZAVnUJHfNUMyGihL
	5eq+pG3lRDwfQgls9tNcOWWiu/A8un+muFq4wyFNngLdNSaRB/TYO23eNuLTCIT+3d4qJJs1eW7ly
	hGWUnLpO+XOC9jOAnhEHp2wSGeYKzRPLHRYeC8CtmiwOVlMnbhBbWpCagk41hyUpK2bKwmsAScyZV
	P2bGT2pGCnBHLZtph8xmdIH0+STtMDAqOa0Uz77rZOA4mWsqDIkRlH/SOKguU0nduj+QnjO06rJiI
	1H2Bec2nqTwEJM2440aguUJ0OW1mgvnWNXaDKXpMdHSZHqlpNBW0zo6DB7sjJpuy6Ltxgvch22Odx
	Jlanu1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojl0-00000005eFf-3CN8;
	Tue, 28 Jul 2026 15:30:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojkz-00000005eFW-3Eqv;
	Tue, 28 Jul 2026 15:30:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8705641AC8;
	Tue, 28 Jul 2026 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4301B1F000E9;
	Tue, 28 Jul 2026 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785252613;
	bh=kHMHe8DXYFbv7HkrjiopSzw/zJOF/JWl21dsP0Poq2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ewu4Kyfbqhdf1jvk5L9GXGpzcB33+Eg/6yRdLcE8d1JVDXQoTvVzDBnFDVp/7c6yB
	 9hj7lZs4vQ4dmZWRWl2spgWiKe6kWE6rPE05cHxhVlMHih9pvWmaQet+wBCpbaKSi5
	 7Cv2lmpeP4xsnVG92JBsR+FooE1So3SFUv4GAnZllYkeQDY48mIIYCI5EKXrDWvoyw
	 Tk/qTuaOQwTAob3WfLD5POa/TEZCb2TGwOOtPiI/54aP+BWBAxcCQR4+JSN7cKicU8
	 UlLxfOlHeDzwpyHdKzAYa1UaPOfhHNqnZhWwgrrdkY/jV/f02u1NYHxIeqCurGVGw2
	 qNETRf1zaM8qQ==
Message-ID: <5306f685-46df-4956-9402-a86834f913c7@kernel.org>
Date: Tue, 28 Jul 2026 17:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 phy-next 0/9] RCW override for 10G Lynx dynamic
 protocol reconfiguration
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tanjeff Moos <tanjeff.moos@westermo.com>, Michael Walle <mwalle@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260723150105.da2cqgtb7t5vw2d3@skbuf>
 <20260728134746.p7zqstau6376xifj@skbuf>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260728134746.p7zqstau6376xifj@skbuf>
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

Hi Oltean,

Le 28/07/2026 à 15:47, Vladimir Oltean a écrit :
> Hi Christophe,
> 
> On Thu, Jul 23, 2026 at 06:01:05PM +0300, Vladimir Oltean wrote:
>> On Wed, Jul 22, 2026 at 02:15:54AM +0300, Vladimir Oltean wrote:
>>> Ioana Ciornei (4):
>>>    soc: fsl: guts: use a macro to encode the DCFG CCSR space
>>>    soc: fsl: guts: add a global structure to hold state
>>>    soc: fsl: guts: add a central fsl_guts_read() function
>>>    soc: fsl: guts: make it easier to determine on which SoC we are
>>>      running
>>>
>>> Vladimir Oltean (5):
>>>    soc: fsl: guts: perform fsl_guts_init() error teardown in reverse
>>>      order of setup
>>>    soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()
>>>    dt-bindings: fsl: layerscape-dcfg: define DCFG_DCSR region
>>>    soc: fsl: guts: implement the RCW override procedure
>>>    phy: lynx-10g: use RCW override procedure for dynamic protocol change
>>
>> Even though I intended these changes for linux-phy (they are also
>> build-tested there), I'm fine either with these changes taken through
>> Vinod's tree with Christophe's ACK for patches 1-8, or through
>> Christophe's tree with Vinod's ACK for patch 9, really.
>>
>> I see on Patchwork there's a minor issue in the commit message of patch 3/9:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Flinux-phy%2Fpatch%2F20260721231603.67865-4-vladimir.oltean%40nxp.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cdfcaa68452fc46a3285108deecaed436%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639208432793851204%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=AUY%2BIZEiFp3aLAO4HlHQCrJ9ZnCyFqzshPEGq6CpfmU%3D&reserved=0
>> "WARNING: 'struture' may be misspelled - perhaps 'structure'?"
>>
>> Could this be fixed up while applying, if there is no other feedback?
> 
> Do you have feedback/a preference for how these patches should be handled?
> 
> I see Vinod acked patch 9, so I guess that means his preference would be
> for you to pick up the entire series (which is indivisible).
> 
> I checked that the patches apply to your soc_fsl branch:
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fchleroy%2Flinux.git%2F%3Fh%3Dsoc_fsl&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cdfcaa68452fc46a3285108deecaed436%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639208432793877128%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=xjpwRCMIncWpW89zKzhil20%2BcUhnG4LPaFNbxw1pue8%3D&reserved=0
> 

Hum ... Seems like I overlooked your message as it was flagged phy-next 
and I was on summer vacation on last two weeks.

I'm fine with taking them via soc_fsl tree. I won't take them today 
because I'm already pushing a large series from Paul Louvel but I'd push 
them by tomorrow or thurday.

Please raise hand if nothing happened by friday.

Christophe

