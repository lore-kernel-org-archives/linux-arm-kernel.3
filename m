Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BDBCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+SZjlpNM6wMx/9LAvmBia8EeGWAQhwYMSyyM0PM5zU=; b=F0CWYAMQ6BRfSZsbm06aUWBVK/
	bIzXnvErhENFMC2XGnHDDIP1D6Ux/nYShgqgU8iFZPANfhEA0ZztLbEdGQ76+2ph8/xHK2W7cKnny
	d/IItFnsO7lt19zD8v0Ao4R152kR8k9/GWXZySlETBRN6oMnZyFOHXqJTTnyJQOXHAkFxGODZuxPX
	Wm8MnWS8rMt8yaKSHUTyIRkQbpO34Fwk1v/eDEQtEQ9KuDVTWMPV8I57wdy1cAR9zI4N16qqR04aU
	ScJp6DSRn6b0dnQXuyMepekVbN6qy6BT3syNCWgillttL5hlsl/G1t16gh2RJY6gksWvvwbrTPxXW
	+HixOGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIr7F-00000007Su4-3SIw;
	Tue, 11 Nov 2025 16:21:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIr7A-00000007Ste-1E8Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:21:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 544AC441E4;
	Tue, 11 Nov 2025 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63CBC4CEF5;
	Tue, 11 Nov 2025 16:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762878063;
	bh=iovQHCOTUN55wUvNH0b2ic0AbO7TgNyy9k87I1v/EvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUjvpjMb5nWSH3Ej5Z6ekUtxyctHK1iWozXPaNNnLbgkyXsh7sIh6/wpN3U2Kqtaz
	 pgz1NYRD0Ge54tnICRqeTqxB/U709bSsmp4nAMLBENSYcuJi8j88LicRiTH55yp1R4
	 4cmPMfvFaaN+92h00ZpxOjncZfiqBh79fYETDtMIf0zKtsslp11kNiiwXUmSO8ZRue
	 xt4sold8J7PsWbk5uoXkPaG23sxeWhlUHlK75vxwyGliH7XfqyVMKLNFo626dsivUn
	 1v2iVu4b1OzKgn8BBC9Zl4bWdMRk0OiLJiwUxAAB8dhZmQtzERxkkTVdLvrn8ElOpu
	 BdA50TiZ+15XQ==
Date: Tue, 11 Nov 2025 10:25:13 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Moritz Fischer <moritz.fischer@ettus.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stephen Boyd <swboyd@chromium.org>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>, 
	Xin Liu <xin.liu@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Umang Chheda <umang.chheda@oss.qualcomm.com>, Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v17 03/12] power: reset: reboot-mode: Add support for 64
 bit magic
Message-ID: <axle2c3i3vfyxpql43dqb4zwzjj65xhsjuhojyf5x26wqo352v@z3nwctubwanx>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-3-46e085bca4cc@oss.qualcomm.com>
 <20251110134529.uljjqzb3vhda3vya@hu-mojha-hyd.qualcomm.com>
 <gzj4r4elqewjt2gjzhuamslvobz5fgyvt672brwknoozlsplaq@wsebzmi2l6pc>
 <681a72ba-d8fb-bfc2-d2bb-d80ac667bc5c@oss.qualcomm.com>
 <zejaqakbtufwzlzs7xc7xzxezcylqjkmu4nne2mro4riuhgbkc@hlgu3u2w36bb>
 <5c83c9a1-e123-95bb-1434-588ee8c52b25@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c83c9a1-e123-95bb-1434-588ee8c52b25@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_082104_401180_545CCBEF 
X-CRM114-Status: GOOD (  39.97  )
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

On Tue, Nov 11, 2025 at 08:20:43PM +0530, Shivendra Pratap wrote:
> 
> 
> On 11/11/2025 12:03 AM, Bjorn Andersson wrote:
> > On Mon, Nov 10, 2025 at 11:22:40PM +0530, Shivendra Pratap wrote:
> >>
> >>
> >> On 11/10/2025 10:00 PM, Bjorn Andersson wrote:
> >>> On Mon, Nov 10, 2025 at 07:15:29PM +0530, Mukesh Ojha wrote:
> >>>> On Sun, Nov 09, 2025 at 08:07:16PM +0530, Shivendra Pratap wrote:
> >>>>> Current reboot-mode supports a single 32-bit argument for any
> >>>>> supported mode. Some reboot-mode based drivers may require
> >>>>> passing two independent 32-bit arguments during a reboot
> >>>>> sequence, for uses-cases, where a mode requires an additional
> >>>>> argument. Such drivers may not be able to use the reboot-mode
> >>>>> driver. For example, ARM PSCI vendor-specific resets, need two
> >>>>> arguments for its operation – reset_type and cookie, to complete
> >>>>> the reset operation. If a driver wants to implement this
> >>>>> firmware-based reset, it cannot use reboot-mode framework.
> >>>>>
> >>>>> Introduce 64-bit magic values in reboot-mode driver to
> >>>>> accommodate dual 32-bit arguments when specified via device tree.
> >>>>> In cases, where no second argument is passed from device tree,
> >>>>> keep the upper 32-bit of magic un-changed(0) to maintain backward
> >>>>> compatibility.
> >>>>>
> >>>>> Update the current drivers using reboot-mode for a 64-bit magic
> >>>>> value.
> >>
> >> [SNIP..]
> >>
> >>>>> +	if (magic > U32_MAX)
> >>>>> +		return -EINVAL;
> >>>>> +
> >>>>> +	magic_32 = magic;
> >>>>> +
> >>>>>  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
> >>>>>  
> >>>>>  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
> >>>>> -				 syscon_rbm->mask, magic);
> >>>>> +				 syscon_rbm->mask, magic_32);
> >>>
> >>> As above, if we're no longer silently discarding bits, I think we should
> >>> compare the magic against syscon_rbm->mask.
> >>>
> >>> No need for a local variable, just type cast after checking the validity.
> >>
> >> Trying to summarize below why we added these check-
> >>
> >> the patch in v11 used typecasting and did not have any of these checks(link below):
> >> https://lore.kernel.org/all/20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com/
> >>
> >> As per below upstream review, type cast was removed and bound checks were added all-over patchset:
> >> "As a general rule of thumb, code with casts is poor quality code. Try
> >> to write the code without casts." - 
> >> https://lore.kernel.org/all/8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch/
> >>
> >> We can revert to the typecast way. Please suggest.
> >>
> > 
> > Okay, I'm okay with Andrew's original request, stick to that for the
> > nvmem case. Although I don't fancy the name "magic_32", and would prefer
> > that you just call it "value" or something.
> 
> sure will make it proper wherever applicable. 
> 
> > 
> > 
> > For pon and syscon however, I'm wondering why you have ignored Andrew's
> > other request from that same email:
> > 
> > """
> > You might be able to go further, and validate that magic actually fits
> > into the field when you consider the << pon->reason_shift.
> > """
> > 
> > Writing "if (magic > U32_MAX)" in a snippet of code where magic isn't
> > allowed to be more than either 32 or 64 is misleading.
> > 
> > For syscon, it's true that the parameter is an unsigned long, but the
> > actual limit better be based on syscon_rbm->mask.
> 
> May be i was not able to interpret it correctly. Basically tried to
> make sure that magic that now coming in a "u64 magic" should be passed
> ahead only it its a 32 bit value.
> 

That is the correct interpretation of the original ask. But what I'm
saying is that if you write:

if (magic > U32_MAX)

then that means "check that magic isn't larger than 32 bits". So the
reader will see that and understand that magic can only be 32 bits.

But the actual PON magic value is 5 or 6 bits, not 32 - so you should
check that the value fits in 5 or 6 bits.

> So should i get rid of the checks done here for syscon and pon?
> 

Continuing to silently ignoring other bits would be one option, but
you've been asked to sanity check the values, so please do that. You
have the code, just compare with the correct value.

Regards,
Bjorn

> thanks,
> Shivendra

