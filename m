Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D977CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5Rdk1tdq+rp8mmNKTSaGG1yUNTWWHIFysYNAvTK0sA=; b=MFM18oGdX76VKADXm+YrE6zJ8O
	ODlnIbRM4f39+ME4/i0AK46QHwmdmkMyQqti8igm1QRdN6dvNTaYPT/Z/lbSkGKokR+BfB6MkqoQ/
	t3ZFc5HhBfYyKOPhZ6Ex+KqFUx+Ucfmv+N9odd9n5IKTN9M7TpZaxFqdUUeuebpNNhGmh+jl96L9N
	oLWv1nl6nMkiIa5Gu0L/YM9o890L/jyo2oNUX3hrP4SfFjBmHThj8GWvCxKfEoxLo4eu9mRpNqUiJ
	KT/pDkJV7KZFQiUxObZTepWkHScDHlfjrjiKir5sKcLwo0zrZALUloyVs5glA5+K0SpWg8ckQwGPE
	NPsW3JDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUib-00000005mwy-28XO;
	Mon, 10 Nov 2025 16:26:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUia-00000005mwq-25cq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:26:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67A05601BD;
	Mon, 10 Nov 2025 16:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9240EC4CEFB;
	Mon, 10 Nov 2025 16:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762791971;
	bh=IPfuQylnIw+J6vOE6q09eI97Ns9VHJzbg5vnx0xQt24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s//iuaT/Pl4OEHgK/m9UzXGs+CneP/bHIDMM57/fguC/4N37jncfiN3PTtSUAUXY4
	 2NmrobrHvb7CNxU2E112LXRKcPCcr0vtzKL3kGqKyi2kLta79tP9r8qvJpDMJzy+1s
	 0tGZObhhSChzqEYC8Jc6GoLXNyXZOiaQ5L36g5KQYRtozsLPQQdb3SGjmNZA44NeQt
	 pJDhsCFAALpWQ8sMf4/2VPpZk05MqLZgrfeqATc7Sd0SnrtKofdPxCrBHd82oUJaZY
	 faymKkI6VHB83rzf3m7JSJulwf6W/fbCZT4UMSbXS3eReIWtAqmXYvJeXUdmLGXe3f
	 7MU6i4BxvS7cg==
Date: Mon, 10 Nov 2025 10:30:16 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
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
Message-ID: <gzj4r4elqewjt2gjzhuamslvobz5fgyvt672brwknoozlsplaq@wsebzmi2l6pc>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-3-46e085bca4cc@oss.qualcomm.com>
 <20251110134529.uljjqzb3vhda3vya@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110134529.uljjqzb3vhda3vya@hu-mojha-hyd.qualcomm.com>
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

On Mon, Nov 10, 2025 at 07:15:29PM +0530, Mukesh Ojha wrote:
> On Sun, Nov 09, 2025 at 08:07:16PM +0530, Shivendra Pratap wrote:
> > Current reboot-mode supports a single 32-bit argument for any
> > supported mode. Some reboot-mode based drivers may require
> > passing two independent 32-bit arguments during a reboot
> > sequence, for uses-cases, where a mode requires an additional
> > argument. Such drivers may not be able to use the reboot-mode
> > driver. For example, ARM PSCI vendor-specific resets, need two
> > arguments for its operation – reset_type and cookie, to complete
> > the reset operation. If a driver wants to implement this
> > firmware-based reset, it cannot use reboot-mode framework.
> > 
> > Introduce 64-bit magic values in reboot-mode driver to
> > accommodate dual 32-bit arguments when specified via device tree.
> > In cases, where no second argument is passed from device tree,
> > keep the upper 32-bit of magic un-changed(0) to maintain backward
> > compatibility.
> > 
> > Update the current drivers using reboot-mode for a 64-bit magic
> > value.
> > 
> > Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> > Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> > Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > ---
> >  drivers/power/reset/nvmem-reboot-mode.c  | 13 +++++++++----
> >  drivers/power/reset/qcom-pon.c           | 11 ++++++++---
> >  drivers/power/reset/reboot-mode.c        | 19 +++++++++++++------
> >  drivers/power/reset/syscon-reboot-mode.c | 11 ++++++++---
> >  include/linux/reboot-mode.h              |  3 ++-
> >  5 files changed, 40 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
> > index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..5d73dde585b1fd438b1847f884feb37cd9e4dd5c 100644
> > --- a/drivers/power/reset/nvmem-reboot-mode.c
> > +++ b/drivers/power/reset/nvmem-reboot-mode.c
> > @@ -16,15 +16,20 @@ struct nvmem_reboot_mode {
> >  	struct nvmem_cell *cell;
> >  };
> >  
> > -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
> > -				    unsigned int magic)
> > +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> >  {
> > -	int ret;
> >  	struct nvmem_reboot_mode *nvmem_rbm;
> > +	u32 magic_32;
> > +	int ret;
> > +
> > +	if (magic > U32_MAX)
> > +		return -EINVAL;
> 
> 
> I believe, we need a comment in all the client driver.. 
> 
> > +
> > +	magic_32 = magic;
> >  
> >  	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
> >  
> > -	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
> > +	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_32, sizeof(magic_32));
> >  	if (ret < 0)
> >  		dev_err(reboot->dev, "update reboot mode bits failed\n");
> >  
> > diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> > index 7e108982a582e8243c5c806bd4a793646b87189f..d0ed9431a02313a7bbaa93743c16fa1ae713ddfe 100644
> > --- a/drivers/power/reset/qcom-pon.c
> > +++ b/drivers/power/reset/qcom-pon.c
> > @@ -27,17 +27,22 @@ struct qcom_pon {
> >  	long reason_shift;
> >  };
> >  
> > -static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
> > -				    unsigned int magic)
> > +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> >  {
> >  	struct qcom_pon *pon = container_of
> >  			(reboot, struct qcom_pon, reboot_mode);
> > +	u32 magic_32;
> >  	int ret;
> > 
> 
> Since we are doing this change in reboot framework, client driver should know about
> it too about this new check because of framework.
> 
> > +	if (magic > U32_MAX || (magic << pon->reason_shift) > U32_MAX)
> 
> 
> is this (magic << pon->reason_shift) > U32_MAX really needed ..?
> 

In my eyes the introduction of a magic_32 variable seems a bit
copy-paste, and this check does tell a similar story...

We have two possible bit patterns:
  GENMASK(7, 2)
  GENMASK(7, 1)

So this means that we have either 5 or 6 bits of magic, not 32.

So far we've just trusted that the mode provided in DeviceTree would
fit, and we've silently discarded the other bits.

But if we're introducing checks here, we should do it properly, if
nothing else for the sake of making the code self-documented.


There's also no need for a new local variable for the magic, check that
we have a valid range and then just typecast it into the argument.

> > +		return -EINVAL;
> > +
> > +	magic_32 = magic << pon->reason_shift;
> > +
> >  	ret = regmap_update_bits(pon->regmap,
> >  				 pon->baseaddr + PON_SOFT_RB_SPARE,
> >  				 GENMASK(7, pon->reason_shift),
> > -				 magic << pon->reason_shift);
> > +				 magic_32);
> >  	if (ret < 0)
> >  		dev_err(pon->dev, "update reboot mode bits failed\n");
> >  
> > diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> > index eff60d6e04df2cb84ba59d38512654336f272f8a..873ac45cd7659b214b7c21958f580ca381e0a63d 100644
> > --- a/drivers/power/reset/reboot-mode.c
> > +++ b/drivers/power/reset/reboot-mode.c
> > @@ -19,12 +19,11 @@
> >  
> >  struct mode_info {
> >  	const char *mode;
> > -	u32 magic;
> > +	u64 magic;
> >  	struct list_head list;
> >  };
> >  
> > -static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
> > -					  const char *cmd)
> > +static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
> >  {
> >  	const char *normal = "normal";
> >  	struct mode_info *info;
> > @@ -56,7 +55,7 @@ static int reboot_mode_notify(struct notifier_block *this,
> >  			      unsigned long mode, void *cmd)
> >  {
> >  	struct reboot_mode_driver *reboot;
> > -	unsigned int magic;
> > +	u64 magic;
> >  
> >  	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
> >  	magic = get_reboot_mode_magic(reboot, cmd);
> > @@ -80,6 +79,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
> >  	struct device_node *np;
> >  	struct property *prop;
> >  	size_t len = strlen(PREFIX);
> > +	u32 magic_arg1;
> > +	u32 magic_arg2;
> >  	int ret;
> >  
> >  	if (!fwnode)
> > @@ -101,12 +102,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
> >  			goto error;
> >  		}
> >  
> > -		if (of_property_read_u32(np, prop->name, &info->magic)) {
> > -			pr_err("reboot mode %s without magic number\n", info->mode);
> > +		if (of_property_read_u32(np, prop->name, &magic_arg1)) {
> > +			pr_err("reboot mode without magic number\n");
> >  			kfree(info);
> >  			continue;
> >  		}
> >  
> > +		if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
> > +			magic_arg2 = 0;
> > +
> > +		info->magic = magic_arg2;
> > +		info->magic = (info->magic << 32) | magic_arg1;

There's no reason to assign the value and then reassign it, it just
makes the code harder to read.

If you mean "info->magic = (magic_arg2 << 32) | magic_arg1" then write
that...

> > +
> >  		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> >  		if (!info->mode) {
> >  			ret =  -ENOMEM;
> > diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
> > index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..3cbd000c512239b12ec51987e900d260540a9dea 100644
> > --- a/drivers/power/reset/syscon-reboot-mode.c
> > +++ b/drivers/power/reset/syscon-reboot-mode.c
> > @@ -20,16 +20,21 @@ struct syscon_reboot_mode {
> >  	u32 mask;
> >  };
> >  
> > -static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
> > -				    unsigned int magic)
> > +static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> >  {
> >  	struct syscon_reboot_mode *syscon_rbm;
> > +	u32 magic_32;
> >  	int ret;
> >
> 
> same here
> 
> > +	if (magic > U32_MAX)
> > +		return -EINVAL;
> > +
> > +	magic_32 = magic;
> > +
> >  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
> >  
> >  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
> > -				 syscon_rbm->mask, magic);
> > +				 syscon_rbm->mask, magic_32);

As above, if we're no longer silently discarding bits, I think we should
compare the magic against syscon_rbm->mask.

No need for a local variable, just type cast after checking the validity.

Regards,
Bjorn

> >  	if (ret < 0)
> >  		dev_err(reboot->dev, "update reboot mode bits failed\n");
> >  
> > diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> > index 22f707ade4ba93592823ea8718d467dbfc5ffd7c..e0d3e8a54050a76f26846f456120b4c7e371d284 100644
> > --- a/include/linux/reboot-mode.h
> > +++ b/include/linux/reboot-mode.h
> > @@ -3,11 +3,12 @@
> >  #define __REBOOT_MODE_H__
> >  
> >  #include <linux/fwnode.h>
> > +#include <linux/types.h>
> >  
> >  struct reboot_mode_driver {
> >  	struct device *dev;
> >  	struct list_head head;
> > -	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
> > +	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
> >  	struct notifier_block reboot_notifier;
> >  };
> >  
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> -Mukesh Ojha

