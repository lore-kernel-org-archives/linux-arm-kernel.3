Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F62CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QmbxN4VfLYHzSRB2Qq2UmgbuXRr7oTK33xCNS7m8dM=; b=VlZd2bawDxEN2pPPjBWRrk7llH
	vO4fo7Km0EigH2p3kVE50/zYP0Q3GrJzzaZwnTDRqdZStJITRNkF2Uc55Gxse6t23bGaFoH7ekS8N
	lIKVXNPn+Y7xIVw/kR9qxPuQF2bVtsamjdWASddHESFNWxx3pNzKeWWTWZx6OY7JnyV5PjCC0qEj/
	IttRrDuELzS+iJnKwYmTAipyQWybVEh89ieuWtC70W7yFIpmcuD27VrWVmXy+BT5q9+VGaSMd1FEe
	Bl8HujSGxIJHYB6rrlpAUlotLqt7IgDfnHm9phohRnYplDjuFcEO+KLgcBHSEx1IgsNc2/jvawOUz
	4ceE35+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIJP-00000009TLQ-3qdI;
	Thu, 01 Oct 2026 15:03:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIJO-00000009TLH-0TgP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:03:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D80F94328D;
	Thu,  1 Oct 2026 15:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0D81F000FF;
	Thu,  1 Oct 2026 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790866985;
	bh=0QmbxN4VfLYHzSRB2Qq2UmgbuXRr7oTK33xCNS7m8dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NY4Q6nhebDqD2A3j9re4F3C/oMnryFA8M44NGEI8CeVOoyPzCfaEEN2jvjNwA5D2S
	 MheIlnQO+bLaNAXEYwzn5pB31DRGwfNA7+pwg/Y148ipAKLi0Fn5DHwxtN0fQUXGqd
	 sb/58McJCPC+Aji7n5MdVONncM/mrxr5/bVQ1ToeBW+YpY5oPHtGiv3A1z+agEGHw0
	 T3tb5qJPdH41IXhZ5mOQio9cJdlQ9FiHkj1RO6u8EiThM5aKzTCeHnRPpg/HH1d2XD
	 VuaTwQpNz8tEQ6LXJmalMGWM1ngrmXXnFSivVFD66pZuto7W9NJYz4zS6BfMj/Jx+h
	 FVL4HBD2EDBTw==
Date: Thu, 1 Oct 2026 16:03:02 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] pinctrl: scmi: Replace pinmux ops get function
 info with generics
Message-ID: <20261001-authentic-dove-of-enthusiasm-bd7ebd@sudeepholla>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
 <20260917-scmi-pinctrl-generics-v2-1-3eeee364257f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-1-3eeee364257f@oss.qualcomm.com>
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

On Thu, Sep 17, 2026 at 03:55:55PM -0700, Alex Tran wrote:
> During probe, populate the pinctrl device with function info
> so that the generic callbacks can be used to fetch function
> count, name, and groups. Remove locally stored functions
> since caching them in this driver is no longer needed.
> 
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 151 +++++++++++++++++------------------------
>  1 file changed, 61 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index 1bb36ca477b7..1d85a16f300d 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -24,6 +24,7 @@
>  #include "pinctrl-utils.h"
>  #include "core.h"
>  #include "pinconf.h"
> +#include "pinmux.h"
>  
>  #define DRV_NAME "scmi-pinctrl"
>  
> @@ -37,8 +38,6 @@ struct scmi_pinctrl {
>  	struct scmi_protocol_handle *ph;
>  	struct pinctrl_dev *pctldev;
>  	struct pinctrl_desc pctl_desc;
> -	struct pinfunction *functions;
> -	unsigned int nr_functions;
>  };
>  
>  static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
> @@ -84,86 +83,6 @@ static const struct pinctrl_ops pinctrl_scmi_pinctrl_ops = {
>  #endif
>  };
>  
> -static int pinctrl_scmi_get_functions_count(struct pinctrl_dev *pctldev)
> -{
> -	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> -
> -	return pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
> -}
> -
> -static const char *pinctrl_scmi_get_function_name(struct pinctrl_dev *pctldev,
> -						  unsigned int selector)
> -{
> -	int ret;
> -	const char *name;
> -	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> -
> -	ret = pinctrl_ops->name_get(pmx->ph, selector, FUNCTION_TYPE, &name);
> -	if (ret) {
> -		dev_err(pmx->dev, "get name failed with err %d", ret);
> -		return NULL;
> -	}
> -
> -	return name;
> -}
> -
> -static int pinctrl_scmi_get_function_groups(struct pinctrl_dev *pctldev,
> -					    unsigned int selector,
> -					    const char * const **p_groups,
> -					    unsigned int * const p_num_groups)
> -{
> -	struct pinfunction *func;
> -	const unsigned int *group_ids;
> -	unsigned int num_groups;
> -	const char **groups;
> -	int ret, i;
> -	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> -
> -	if (!p_groups || !p_num_groups)
> -		return -EINVAL;
> -
> -	if (selector >= pmx->nr_functions)
> -		return -EINVAL;
> -
> -	func = &pmx->functions[selector];
> -	if (func->ngroups)
> -		goto done;
> -
> -	ret = pinctrl_ops->function_groups_get(pmx->ph, selector, &num_groups,
> -					       &group_ids);
> -	if (ret) {
> -		dev_err(pmx->dev, "Unable to get function groups, err %d", ret);
> -		return ret;
> -	}
> -	if (!num_groups)
> -		return -EINVAL;
> -
> -	groups = kcalloc(num_groups, sizeof(*groups), GFP_KERNEL);
> -	if (!groups)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < num_groups; i++) {
> -		groups[i] = pinctrl_scmi_get_group_name(pctldev, group_ids[i]);
> -		if (!groups[i]) {
> -			ret = -EINVAL;
> -			goto err_free;
> -		}
> -	}
> -
> -	func->ngroups = num_groups;
> -	func->groups = groups;
> -done:
> -	*p_groups = func->groups;
> -	*p_num_groups = func->ngroups;
> -
> -	return 0;
> -
> -err_free:
> -	kfree(groups);
> -
> -	return ret;
> -}
> -
>  static int pinctrl_scmi_func_set_mux(struct pinctrl_dev *pctldev,
>  				     unsigned int selector, unsigned int group)
>  {
> @@ -190,9 +109,9 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
>  static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
>  	.request = pinctrl_scmi_request,
>  	.free = pinctrl_scmi_free,
> -	.get_functions_count = pinctrl_scmi_get_functions_count,
> -	.get_function_name = pinctrl_scmi_get_function_name,
> -	.get_function_groups = pinctrl_scmi_get_function_groups,
> +	.get_functions_count = pinmux_generic_get_function_count,
> +	.get_function_name = pinmux_generic_get_function_name,
> +	.get_function_groups = pinmux_generic_get_function_groups,
>  	.set_mux = pinctrl_scmi_func_set_mux,
>  };
>  
> @@ -487,6 +406,60 @@ static const struct pinconf_ops pinctrl_scmi_pinconf_ops = {
>  	.pin_config_config_dbg_show = pinconf_generic_dump_config,
>  };
>  
> +static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
> +{
> +	unsigned int nr_funcs, nr_groups, i, j;
> +	const unsigned int *group_ids;
> +	const char *fname;
> +	const char **gnames;
> +	int ret;
> +
> +	nr_funcs = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
> +
> +	for (i = 0; i < nr_funcs; i++) {
> +		ret = pinctrl_ops->name_get(pmx->ph, i, FUNCTION_TYPE,
> +					    &fname);
> +		if (ret)
> +			return ret;
> +
> +		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
> +						       &nr_groups,
> +						       &group_ids);
> +		if (ret)
> +			return ret;
> +
> +		if (!nr_groups)
> +			dev_warn(pmx->dev,
> +				 "Function %s contains no groups\n",
> +				 fname);
> +
> +		gnames = devm_kmalloc_array(pmx->dev, nr_groups,
> +					    sizeof(*gnames), GFP_KERNEL);
> +		if (!gnames)
> +			return -ENOMEM;
> +
> +		for (j = 0; j < nr_groups; j++) {
> +			ret = pinctrl_ops->name_get(pmx->ph, group_ids[j],
> +						    GROUP_TYPE, &gnames[j]);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
> +				  nr_groups, NULL);
> +		if (ret < 0)
> +			return ret;

Since this will fail the probe, don't we have to pinmux_generic_remove_function()
for all the added functions ? I don't know if devm_* takes care of it, just
thought I have check as I don't have much deeper knowledge of pinctl
sub-system.

If the above cleanup is needed, with that added, else w/o it:

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

It is a nice cleanup to avoid unnecessary duplication and move to reuse of
functionality provided already by the core pinctl.

-- 
Regards,
Sudeep

