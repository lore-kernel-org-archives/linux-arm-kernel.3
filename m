Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81D5C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=felpSIkdk6QTqa6eAv8dEuh25mt0u+aADh0BF20qvVM=; b=elU7BBzSGXuFACi60TUm/hvou5
	pMc3qQ57aGEG8hSUlrlAxgfDjMfDqDwF6yYKc2fjS6zR02iBJAddUlK2Hws/5YvKDLjavCoj29XRp
	O+qTiqy7FpeKI4+np/8BGq/6LvzeyaXlU+kkUnYzzVemX/sOosEyoKqxn6nKpcaLD2qJ+Dql7a+nN
	tUixd8o6Pu+EmUCr/d7HEol5mH8QCPF/pszei+fUSubtt2EaVCFKPc+DVu+CT2IGXoNsjUinBeRS7
	kfEXgR/Q3PK+nuTVxdpCTuEtIzgEnbHWvwvFSeRhOLPljeLH2ZJzf52DoxlP7e906VbFDri9RigLP
	XSVfIYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwI7-00000005eZ7-3Bat;
	Thu, 06 Aug 2026 11:29:39 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwI5-00000005eXv-1C6e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:29:38 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1786015764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=felpSIkdk6QTqa6eAv8dEuh25mt0u+aADh0BF20qvVM=;
	b=n5qLcXtuXkYS0rpKRIbv02qJcUNngkhYcwZ+ntbyiLi6oT4MFMB/tSYI22gM1bCcPjLurC
	Zn6BgtaMWwJZFCw4KIuyeZo/8ASpSMkf2Z2ShjDCf6Hc0Om2dY2i7YWOI40p392WwQ9MiC
	SnXxX2r8bzVcxujq/SfpnXPHLyk8BdXtqxvVFu4XzDztHc3de/8uQTIafYp0cG3I581rsl
	0U5XROAavYc4dyiTKLNT+89IdGZDTpd/sMfA+evf3NDV2/8zDae95uBwq8B4IYiCdioJ7a
	5htupH3TR1kTzVm9e3SDexfmZmjnWRxEL2mcy3GKhSPQvwPayzPRUONxIJ7+Iw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 13:29:05 +0200
Message-Id: <DKHTQQEWO6S1.1IKS244AQ1263@cknow-tech.com>
Cc: <royalnet026@gmail.com>, <alchark@flipper.net>,
 <chaoyi.chen@rock-chips.com>, <iommu@lists.linux.dev>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v6 3/9] dt-bindings: iommu: rockchip: allow the
 RK3576 NPU MMU clock set
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Jiaxing Hu" <gahing@gahingwoo.com>, <diederik@cknow-tech.com>,
 <heiko@sntech.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <joro@8bytes.org>, <will@kernel.org>,
 <robin.murphy@arm.com>, <tomeu@tomeuvizoso.net>
References: <20260806063413.350184-1-gahing@gahingwoo.com>
 <20260806063413.350184-4-gahing@gahingwoo.com>
 <DKHR2P0XJF0B.OY937NT39DR7@cknow-tech.com>
 <20260806095551.368456-1-gahing@gahingwoo.com>
In-Reply-To: <20260806095551.368456-1-gahing@gahingwoo.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_042937_506669_5A7BE557 
X-CRM114-Status: GOOD (  19.29  )
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

Hi Jiaxing,

On Thu Aug 6, 2026 at 11:55 AM CEST, Jiaxing Hu wrote:
> Hi Diederik,
>
>> Now every MMU with "rockchip,rk3568-iommu", "rockchip,rk3588-iommu" or
>> "rockchip,rk3576-iommu" is allowed to have a minimum of 2 clocks, instea=
d
>> of having exactly 2 clocks. That does not sound desirable.
>
> You are right, and it is worse than sounding undesirable, it actually

Yeah, it was a 'bit' of an understatement ;-)

> happens. I gave an RK3588 NPU MMU a bogus third clock and v6's schema
> accepted it without a word. That is a real loss of coverage for every
> existing Rockchip IOMMU and I should not have sent it that way.
>
> Fixed for v7 the way you and the bot suggest, with a compatible of its
> own:

If you haven't already, it's probably worth checking whether Sashiko made
other useful remarks. I don't feel qualified to judge those, so I didn't
reference those. But they made be valid as well. Or hallucinations ;-)

>   compatible =3D "rockchip,rk3576-npu-iommu", "rockchip,rk3568-iommu";
>
> and an allOf that pins each side:
>
>   if compatible contains rockchip,rk3576-npu-iommu
>     then clocks/clock-names minItems: 5
>     else clocks/clock-names maxItems: 2
>
> so the NPU MMUs are required to carry all five and everything else is
> back to exactly two. Checked in both directions: the three clock RK3588
> node is rejected again, an NPU MMU with only aclk and iface is rejected,
> and every rockchip dtb in the tree validates clean.
>
> No driver change goes with it. rk_iommu matches only "rockchip,iommu"
> and "rockchip,rk3568-iommu", and the fallback stays, so the new string
> is documentation only.

I'll leave it up to others to comment whether that's correct or not.

Another thing you could consider is splitting this NPU iommu 'stuff' into
a separate patch set and drop the RFC 'prefix' for that series.
IIUC the RFC is (only) related to the working of the NPU on RK3576.

Cheers,
  Diederik

> The name is the part I am least sure of. Everything else in that binding
> ends in -iommu, which is why I did not use -mmu to pair with the
> rknn-core node it belongs to. Happy to change it if Heiko or Krzysztof
> prefer something else.
>
> Thanks for catching it.
>
> Cheers,
> Jiaxing
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip



