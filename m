Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D4CCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 00:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQZO2SJ8vBK2gfT15V0wBgbwbzZtnCPRdiAcTkZnuSk=; b=i6YefPkWZNtERmsITg14+Z3vWT
	8XqG9zDkizGjLJ+cJ4CXBAnFgObVjt5vRICfO29n9J1BJzreghCeV0MeQYDt1SWRtBS/8WbIeR+Ra
	tAJBgdOJZvR/V7q6D9Cj97J+IunUKXE7RVVt4S24KMbSqRXFHBxP4fpUaWM6/XXUWwmJoHAuSRFQm
	ZaDa0ZTW3tCEG+qaxY6dgatxdgHvhWXZptvy703TCty4Numdh7+c7oi+1WLBmXWtnJgGElZt2jVC8
	WHiFWBm6N1LlvVYPNqlKoZxbWP3xlKV4KQ6dJJWt3/ip6ieqQWOwCBZnZStGrJQnpn4J3aPX1bY+r
	NT0zHKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7N51-00000009Yp5-1dJ4;
	Sat, 11 Oct 2025 00:03:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7N4y-00000009Yoj-0tOL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 00:03:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 399C11595;
	Fri, 10 Oct 2025 17:03:09 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35FA03F59E;
	Fri, 10 Oct 2025 17:03:15 -0700 (PDT)
Date: Sat, 11 Oct 2025 01:02:51 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <lpieralisi@kernel.org>, <mark.rutland@arm.com>,
 <sudeep.holla@arm.com>, <ardb@kernel.org>, <chao.gao@intel.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-coco@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <sdonthineni@nvidia.com>,
 <vsethi@nvidia.com>, <vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 1/3] firmware: smccc: LFA: use smcc 1.2
Message-ID: <20251011010251.50c8be14@minigeek.lan>
In-Reply-To: <20251008190907.181412-2-vvidwans@nvidia.com>
References: <20251008190907.181412-1-vvidwans@nvidia.com>
 <20251008190907.181412-2-vvidwans@nvidia.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_170320_371654_2743E006 
X-CRM114-Status: GOOD (  29.23  )
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

On Wed, 8 Oct 2025 19:09:05 +0000
Vedashree Vidwans <vvidwans@nvidia.com> wrote:

Hi Vedashree,

> Update driver to use SMCCC 1.2+ version as mentioned in the LFA spec.

ah, right, good catch, one call is using x4, so this must be the v1.2
calling convention.

Just one small thing below...

> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>  drivers/firmware/smccc/lfa_fw.c | 80 +++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index 1f333237271d8..49f7feb6a211b 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -117,9 +117,13 @@ static struct kobject *lfa_dir;
>  
>  static int get_nr_lfa_components(void)
>  {
> -	struct arm_smccc_res res = { 0 };
> +	struct arm_smccc_1_2_regs args = { 0 };
> +	struct arm_smccc_1_2_regs res = { 0 };

>  
> -	arm_smccc_1_1_invoke(LFA_1_0_FN_GET_INFO, 0x0, &res);
> +	args.a0 = LFA_1_0_FN_GET_INFO;
> +	args.a1 = 0; /* lfa_info_selector = 0 */
> +
> +	arm_smccc_1_2_invoke(&args, &res);

I wonder if we can share the same struct for both request and reply?
	arm_smccc_1_2_invoke(&args, &args);

Looks like a lot of stack space used for just a few registers.
Same for the other occasions where we just do the smc once.

Cheers,
Andre.

>  	if (res.a0 != LFA_SUCCESS)
>  		return res.a0;
>  
> @@ -129,20 +133,23 @@ static int get_nr_lfa_components(void)
>  static int call_lfa_activate(void *data)
>  {
>  	struct image_props *attrs = data;
> -	struct arm_smccc_res res = { 0 };
> +	struct arm_smccc_1_2_regs args = { 0 };
> +	struct arm_smccc_1_2_regs res = { 0 };
> +
> +	args.a0 = LFA_1_0_FN_ACTIVATE;
> +	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
> +	/*
> +	 * As we do not support updates requiring a CPU reset (yet),
> +	 * we pass 0 in args.a3 and args.a4, holding the entry point and context
> +	 * ID respectively.
> +	 * We want to force CPU rendezvous if either cpu_rendezvous or
> +	 * cpu_rendezvous_forced is set. The flag value is flipped as
> +	 * it is called skip_cpu_rendezvous in the spec.
> +	 */
> +	args.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
>  
>  	do {
> -		/*
> -		 * As we do not support updates requiring a CPU reset (yet),
> -		 * we pass 0 in x3 and x4, holding the entry point and context
> -		 * ID respectively.
> -		 * We want to force CPU rendezvous if either cpu_rendezvous or
> -		 * cpu_rendezvous_forced is set. The flag value is flipped as
> -		 * it is called skip_cpu_rendezvous in the spec.
> -		 */
> -		arm_smccc_1_1_invoke(LFA_1_0_FN_ACTIVATE, attrs->fw_seq_id,
> -			!(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous),
> -			0, 0, &res);
> +		arm_smccc_1_2_invoke(&args, &res);
>  	} while (res.a0 == 0 && res.a1 == 1);
>  
>  	return res.a0;
> @@ -150,7 +157,8 @@ static int call_lfa_activate(void *data)
>  
>  static int activate_fw_image(struct image_props *attrs)
>  {
> -	struct arm_smccc_res res = { 0 };
> +	struct arm_smccc_1_2_regs args = { 0 };
> +	struct arm_smccc_1_2_regs res = { 0 };
>  	int ret;
>  
>  	/*
> @@ -159,8 +167,10 @@ static int activate_fw_image(struct image_props *attrs)
>  	 * LFA_PRIME/ACTIVATE will need to be called again.
>  	 * res.a1 will become 0 once the prime/activate process completes.
>  	 */
> +	args.a0 = LFA_1_0_FN_PRIME;
> +	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
>  	do {
> -		arm_smccc_1_1_invoke(LFA_1_0_FN_PRIME, attrs->fw_seq_id, &res);
> +		arm_smccc_1_2_invoke(&args, &res);
>  		if (res.a0 != LFA_SUCCESS) {
>  			pr_err("LFA_PRIME failed: %s\n",
>  				lfa_error_strings[-res.a0]);
> @@ -211,13 +221,16 @@ static ssize_t activation_pending_show(struct kobject *kobj,
>  {
>  	struct image_props *attrs = container_of(attr, struct image_props,
>  					 image_attrs[LFA_ATTR_ACT_PENDING]);
> -	struct arm_smccc_res res = { 0 };
> +	struct arm_smccc_1_2_regs args = { 0 };
> +	struct arm_smccc_1_2_regs res = { 0 };
>  
>  	/*
>  	 * Activation pending status can change anytime thus we need to update
>  	 * and return its current value
>  	 */
> -	arm_smccc_1_1_invoke(LFA_1_0_FN_GET_INVENTORY, attrs->fw_seq_id, &res);
> +	args.a0 = LFA_1_0_FN_GET_INVENTORY;
> +	args.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&args, &res);
>  	if (res.a0 == LFA_SUCCESS)
>  		attrs->activation_pending = !!(res.a3 & BIT(1));
>  
> @@ -298,9 +311,12 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
>  {
>  	struct image_props *attrs = container_of(attr, struct image_props,
>  						 image_attrs[LFA_ATTR_CANCEL]);
> -	struct arm_smccc_res res = { 0 };
> +	struct arm_smccc_1_2_regs args = { 0 };
> +	struct arm_smccc_1_2_regs res = { 0 };
>  
> -	arm_smccc_1_1_invoke(LFA_1_0_FN_CANCEL, attrs->fw_seq_id, &res);
> +	args.a0 = LFA_1_0_FN_CANCEL;
> +	args.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&args, &res);
>  
>  	/*
>  	 * When firmware activation is called with "skip_cpu_rendezvous=1",
> @@ -395,14 +411,17 @@ static int create_fw_inventory(char *fw_uuid, int seq_id, u32 image_flags)
>  
>  static int create_fw_images_tree(void)
>  {
> -	struct arm_smccc_res res = { 0 };
> +	struct arm_smccc_1_2_regs args = { 0 };
> +	struct arm_smccc_1_2_regs res = { 0 };
>  	struct uuid_regs image_uuid;
>  	char image_id_str[40];
>  	int ret, num_of_components;
>  
>  	num_of_components = get_nr_lfa_components();
> +	args.a0 = LFA_1_0_FN_GET_INVENTORY;
>  	for (int i = 0; i < num_of_components; i++) {
> -		arm_smccc_1_1_invoke(LFA_1_0_FN_GET_INVENTORY, i, &res);
> +		args.a1 = i; /* fw_seq_id under consideration */
> +		arm_smccc_1_2_invoke(&args, &res);
>  		if (res.a0 == LFA_SUCCESS) {
>  			image_uuid.uuid_lo = res.a1;
>  			image_uuid.uuid_hi = res.a2;
> @@ -420,10 +439,23 @@ static int create_fw_images_tree(void)
>  
>  static int __init lfa_init(void)
>  {
> -	struct arm_smccc_res res = { 0 };
> +	struct arm_smccc_1_2_regs args = { 0 };
> +	struct arm_smccc_1_2_regs res = { 0 };
>  	int err;
>  
> -	arm_smccc_1_1_invoke(LFA_1_0_FN_GET_VERSION, &res);
> +	/* LFA requires SMCCC version >= 1.2 */
> +	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2) {
> +		pr_err("Not supported with SMCCC version %u", arm_smccc_get_version());
> +		return -ENODEV;
> +	}
> +
> +	if (arm_smccc_1_1_get_conduit() == SMCCC_CONDUIT_NONE) {
> +		pr_err("Invalid SMCCC conduit");
> +		return -ENODEV;
> +	}
> +
> +	args.a0 = LFA_1_0_FN_GET_VERSION;
> +	arm_smccc_1_2_invoke(&args, &res);
>  	if (res.a0 == -LFA_NOT_SUPPORTED) {
>  		pr_err("Arm Live Firmware activation(LFA): no firmware agent found\n");
>  		return -ENODEV;


