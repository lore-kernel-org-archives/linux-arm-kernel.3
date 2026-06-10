Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784A0CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXhOcqMPHO+S5QqlHxh7fMeK781ZP72bMnS5EH8zaug=; b=vnMo5U1F5/jjYKKrqdkEuuxszj
	9CoXEnfgsZAT8xK8dKJoRHbWd0GcTFCHgMuQfavcNRbuW9G63tIoe3n7etNU07meOFACNygZCxYAA
	YbuczViZAWsrZxDk6MR4KoEsmKMJU/zniSVUEsYg7kdSrrev6Y9b/YXkcKLVurKChbTRor8PiH3pE
	LjzFO2WTV1LRAKGfSMoY4sgte1ATQ5Qi2Pnl/Hg7A9AW1RoU9h/qJgQVknJK0jj6DsSM71qK5+rGj
	t7Z+EotlavRejTgpXlNsZx//kCTAUQHAYzM5G38tyGJZuYv3RGxzXMv7N1CMSoUTcAzqJxp/96sNY
	fJOq9QnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFp3-00000007Ld9-2abK;
	Wed, 10 Jun 2026 10:06:09 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFp1-00000007Lbo-0pVD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:06:08 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781085953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YXhOcqMPHO+S5QqlHxh7fMeK781ZP72bMnS5EH8zaug=;
	b=X3cX35ljKdPrn8ghjGraHP1nRfUjKOzodTDZBQC8Bodbl4K5BZ3SeQCEUQYnIQHXomWMv2
	GDYsnnYDG6qC9nxUOC6skm9sE/n1P6wkH55bWQZjwRr28gq4kBZemajTf/2mM0CPe52B5u
	4IASRmUHKLwqpGKX38uLjYe3EMrnhDqZppAtJmbn8Ed7cp/1gIkFPaAccACARsT97Bxzcs
	HPydH1A3PBbFf0pU8obu+92IEPA+vLo2RX0wsIfwwIjfCjhrfZQFDAtSiiSsMaiiVXOyM+
	irD1BK2deVH2yC9tmxTdbTJXa+lrr3N7jnjiUNuYuTEjOYBkP69T0tsjKXcRaA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 12:05:49 +0200
Message-Id: <DJ5A9XL183RZ.20J3ASQ3EWUZ6@cknow-tech.com>
Cc: <tomeu@tomeuvizoso.net>, <ogabbay@kernel.org>, <heiko@sntech.de>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Simon Xue"
 <xxm@rock-chips.com>, "Finley Xiao" <finley.xiao@rock-chips.com>, "Jonas
 Karlman" <jonas@kwiboo.se>
Subject: Re: [RFC PATCH v3 0/9] accel: rocket: Add RK3568 NPU support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Chaoyi Chen" <chaoyi.chen@rock-chips.com>, "Midgy Balon"
 <midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
 <3d99569e-9c3a-49d1-93fb-1335382523e9@rock-chips.com>
 <CA+GS1Y1s78PwN63X2YJoS8VEGp7CpTERo_K65yKs00U4VRAw4Q@mail.gmail.com>
 <e5058919-9485-4de5-8eea-331ebfc2987c@rock-chips.com>
 <CA+GS1Y3ysdWZ3qCq3ip_Pbw+v4LxHZd95aBo=jwB+orYaMBBNw@mail.gmail.com>
 <CA+GS1Y0kAM_XGLQuKPTphif2HcQg18ZXhd8RHHr2xPOEMCDvXA@mail.gmail.com>
 <bcedaff0-abf8-4585-a0ea-057062cd0411@rock-chips.com>
 <CA+GS1Y2-hRqpGgsknh+oOX+-uZ3DZtdekdP9viTP6a40zhhUhg@mail.gmail.com>
 <b05f7154-e85f-4207-80ae-f080282ba780@rock-chips.com>
In-Reply-To: <b05f7154-e85f-4207-80ae-f080282ba780@rock-chips.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_030607_515598_146D3297 
X-CRM114-Status: GOOD (  25.40  )
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

Hi,

On Wed Jun 10, 2026 at 3:14 AM CEST, Chaoyi Chen wrote:
> Hi Midgy,
>
> On 6/9/2026 7:11 PM, Midgy Balon wrote:
>> Hello Chaoyi,
>>=20
>> You were right - building rocket as a module fixes it. Thanks for the po=
inter.
>>=20
>> I rebuilt with CONFIG_DRM_ACCEL_ROCKET=3Dm (everything else the same:
>> need_regulator on
>> the RK3568 NPU power domain via a DOMAIN_M_R variant, domain-supply =3D
>> <&vdd_npu>, and the
>> regulator-always-on workaround dropped). The board now boots cleanly
>> and, more importantly,
>> an NPU job submit no longer hangs: I ran the test workload five times
>> with no RCU stall and
>> no freeze.
>>=20
>> So with rocket=3Dm the need_regulator approach works on RK3568, and I'll
>> keep it for v4
>> (domain-supply + need_regulator, instead of marking vdd_npu
>> always-on). rocket=3Dm is the
>> normal configuration anyway; my earlier hang came from building it =3Dy
>> in a self-contained
>> image, so it probed in the initcalls (around 2 s) and the genpd ->
>> I2C-PMIC regulator
>> transition ran before the system was ready. As a module it loads from
>> udev much later
>> (~6.8 s here), after the I2C controller and regulator core are fully up.
>>=20
>> On your question of when the device-link error is printed - it is at
>> power-domain
>> controller probe, not at the rocket probe:
>>=20
>>   [    2.700618] vdd_npu: Bringing 500000uV into 825000-825000uV
>>   [    2.749637] rockchip-pm-domain fdd90000.power-management:power-cont=
roller:
>>                  Failed to create device link (0x180) with supplier 0-00=
20 for
>>                  /power-management@fdd90000/power-controller/power-domai=
n@6
>>   [    2.945955] platform fde40000.npu: Adding to iommu group 3
>>   ...
>>   [    6.840374] rocket: loading out-of-tree module taints kernel.
>>   [    6.877647] [drm] Initialized rocket 0.0.0 for rknn on minor 0
>>   [    6.879950] rocket fde40000.npu: Rockchip NPU core 0 version: 0
>>=20
>> So the device-link to the rk809 PMIC (0-0020) fails to form at ~2.75
>> s, well before rocket
>> loads at ~6.8 s. It is non-fatal here - the vdd_npu rail is brought up
>> by the regulator core
>> and all jobs run - and there is no "failed to get ack on domain npu"
>> NoC warning this boot
>> (the always-on kernel had one). The complete boot log is attached.
>>=20
>> Two notes / one question:
>> - This boot used fw_devlink=3Dpermissive on the command line. Is the
>> "Failed to create device
>>   link ... supplier 0-0020" at pmdomain probe expected/benign, or is
>> there a clean way to make
>>   it order correctly (so it also works without permissive, and a =3Dy
>> build wouldn't deadlock in
>>   the initcalls)?
>
> We encountered the same issue on the RK3588 NPU before. And it was
> resolved with the following patch at that time.
>
> https://lore.kernel.org/all/20251216055247.13150-1-rmxpzlb@gmail.com/
>
> Please compare the differences in NPU pmdomain and DTS configuration
> between the RK3568 and RK3588.

About a month ago on #linux-rockchip we were discussing PM 'stuff':
https://libera.catirclogs.org/linux-rockchip/2026-05-15#39939137;
which references this paste
https://paste.sr.ht/~diederik/89d9f84e22474e837b55286d213b67f03859ce2e
I've since removed the DCDC_REG2 for PineTab2 and the 'fix' should likely
be extended to cover all RK3566/RK3568 devices though.

It's what I made at the time hoping to fix a suspend/resume issue when
trying upstream TF-A. It didn't fix the issue at the time, but may still
be useful/needed and I think it's what Chaoyi hinted at.

Just yesterday, Jonas posted this patch which may be useful/needed too:
https://lore.kernel.org/linux-rockchip/20260609154124.445182-1-jonas@kwiboo=
.se/

HTH,
  Diederik

>> - (The convolution output is still uniform zero-point / the job times
>> out - that is the
>>   separate NPU compute-completion issue, unrelated to the power-domain
>> work. Finley, that is
>>   the one I flagged earlier re PVTPLL/NoC.)
>>=20
>> Kind regards,
>> Midgy
>>=20


