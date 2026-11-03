Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DAB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W6vCmwmj;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=BUdINLj2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bh5yMwUWDnGdG3bsKzFrztnC6sY/UYimpMt5M5ZXR+Y=; b=W6vCmwmjsJwMSh
	k0/GQWXuusg7LKn6VG9YaVJb/w3Q/5HgMA+BBI6V/FkL2ufGQeh4GjOjR03KqwlKfY/GAre6yAS4+
	YBqTwwOdVvJkzg+W0UjbrHh3PB4mRQPdaSSKqbwRlNusWnqVIydZ6OZJWszvNAV6/eVv5qdM+1vQH
	BMdP3SQ+Nm7s7jlmB5wlTeby5zd020LiM9i2TXFoqnLjq73spprOpuobyJfIeCSzzQtDwEFIi4h4C
	OiO2u/PTrhgsiKSFLS46JZvIqgNrXTrB2l8cAXkblpnhbL0NOhkla3uB1b4sBw+nQ0CIXMianiy4d
	mhzsy4WW7YTKCPiyoRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Sn-00000001TD2-2VvD;
	Tue, 03 Nov 2026 08:01:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Si-00000001TBq-10zd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:01:48 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A6F6227;
	Tue,  3 Nov 2026 08:59:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793692765;
	bh=xVwspL7fT2CPxcmsQH28unTSm93hJ2OW9ltA6B5/iMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BUdINLj2z5kq+yM3cem9o6QkP+4IbabN8MIESXyc786eXW+i7L6cB3KEwCTA0lr0Z
	 1sd6631mGTEii23FP1qyrykOpczbF8UEVk8Y+Uc1dMjecrjUc8dskB+fi0ulXbDmuT
	 Q1KvN2bIQYR/k3Ul+WnDqim7VQWwSb+kZpqyrcXw=
Message-ID: <8c9efa73-9dec-442c-9b3e-ed78a13bcfa3@ideasonboard.com>
Date: Tue, 3 Nov 2026 10:01:38 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/14] drm/tidss: oldi: Add power domain support
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-11-dc7f2b532478@ideasonboard.com>
 <4148e258-b406-4964-82b3-11ea624f974e@linux.dev>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <4148e258-b406-4964-82b3-11ea624f974e@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_000144_437511_3EA4BAC7 
X-CRM114-Status: GOOD (  27.62  )
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 02/11/2026 15:45, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 29/10/26 10:18, Tomi Valkeinen wrote:
>> The OLDI TXes on AM62P and J722S have power domains of their own,
>> described in the DT, unlike the earlier SoCs. The OLDI TX nodes are not
>> real devices, so the driver core does not attach these power domains,
>> and nothing in the core turns them on.
>>
>> Add support to attach the PDs with dev_pm_domain_attach_by_node(), and
>> manage the power state of the returned virtual devices with runtime PM
>> functions.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_oldi.c | 88 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 88 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
>> index 5552c1c51074..df2326db3302 100644
>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>> @@ -10,6 +10,8 @@
>>   #include <linux/of_graph.h>
>>   #include <linux/mfd/syscon.h>
>>   #include <linux/media-bus-format.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/regmap.h>
>>   
>>   #include <drm/drm_atomic_helper.h>
>> @@ -35,6 +37,12 @@ struct tidss_oldi {
>>   
>>   	struct clk *serial;
>>   	struct regmap *io_ctrl;
>> +
>> +	/*
>> +	 * The power domains of this OLDI TX and, in dual-link mode, of its
>> +	 * companion. NULL for an OLDI TX without a power domain of its own.
>> +	 */
>> +	struct device *pd_devs[2];
>>   };
>>   
>>   struct oldi_bus_format {
>> @@ -238,6 +246,22 @@ static int tidss_oldi_atomic_check(struct drm_bridge *bridge,
>>   	return 0;
>>   }
>>   
>> +static void tidss_oldi_power_get(struct tidss_oldi *oldi)
>> +{
>> +	for (unsigned int i = 0; i < ARRAY_SIZE(oldi->pd_devs); i++) {
>> +		if (oldi->pd_devs[i])
>> +			WARN_ON(pm_runtime_get_sync(oldi->pd_devs[i]) < 0);
>> +	}
>> +}
>> +
>> +static void tidss_oldi_power_put(struct tidss_oldi *oldi)
>> +{
>> +	for (unsigned int i = 0; i < ARRAY_SIZE(oldi->pd_devs); i++) {
>> +		if (oldi->pd_devs[i])
>> +			pm_runtime_put(oldi->pd_devs[i]);
>> +	}
>> +}
>> +
>>   static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
>>   					 struct drm_atomic_commit *state)
>>   {
>> @@ -251,6 +275,8 @@ static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
>>   	if (oldi->link_type == OLDI_MODE_SECONDARY_CLONE_SINGLE_LINK)
>>   		return;
>>   
>> +	tidss_oldi_power_get(oldi);
>> +
>>   	connector = drm_atomic_get_new_connector_for_encoder(state,
>>   							     bridge->encoder);
>>   	if (WARN_ON(!connector))
>> @@ -296,6 +322,8 @@ static void tidss_oldi_atomic_post_disable(struct drm_bridge *bridge,
>>   
>>   	/* Clear OLDI Config */
>>   	tidss_disable_oldi(oldi->tidss, oldi->parent_vp);
>> +
>> +	tidss_oldi_power_put(oldi);
>>   }
>>   
>>   #define MAX_INPUT_SEL_FORMATS	1
>> @@ -468,6 +496,60 @@ static int get_parent_dss_vp(struct device_node *oldi_tx, u32 *parent_vp)
>>   	return -ENODEV;
>>   }
>>   
>> +static void tidss_oldi_detach_pd(void *data)
>> +{
>> +	struct device *pd_dev = data;
>> +
>> +	dev_pm_domain_detach(pd_dev, true);
>> +}
>> +
>> +static struct device *tidss_oldi_create_pd_dev(struct tidss_device *tidss,
>> +					       struct device_node *oldi_tx)
>> +{
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	dev = dev_pm_domain_attach_by_node(tidss->dev, oldi_tx, 0);
>> +	if (IS_ERR_OR_NULL(dev))
>> +		return dev;
>> +
>> +	ret = devm_add_action_or_reset(tidss->dev, tidss_oldi_detach_pd, dev);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return dev;
>> +}
>> +
>> +static int tidss_oldi_create_pd_devs(struct tidss_device *tidss,
>> +				     struct tidss_oldi *oldi,
>> +				     struct device_node *oldi_tx)
>> +{
>> +	struct device_node *companion;
>> +	struct device *pd_dev;
>> +
>> +	pd_dev = tidss_oldi_create_pd_dev(tidss, oldi_tx);
>> +	if (IS_ERR(pd_dev))
>> +		return PTR_ERR(pd_dev);
>> +
>> +	oldi->pd_devs[0] = pd_dev;
>> +
>> +	if (oldi->companion_instance < 0)
>> +		return 0;
>> +
>> +	companion = of_parse_phandle(oldi_tx, "ti,companion-oldi", 0);
>> +	if (!companion)
>> +		return -EINVAL;
>> +
>> +	pd_dev = tidss_oldi_create_pd_dev(tidss, companion);
>> +	of_node_put(companion);
>> +	if (IS_ERR(pd_dev))
>> +		return PTR_ERR(pd_dev);
>> +
>> +	oldi->pd_devs[1] = pd_dev;
>> +
>> +	return 0;
>> +}
>> +
>>   void tidss_oldi_deinit(struct tidss_device *tidss)
>>   {
>>   	for (int i = 0; i < tidss->num_oldis; i++) {
>> @@ -610,6 +692,12 @@ static int tidss_oldi_init_one(struct tidss_device *tidss,
>>   		}
>>   	}
>>   
>> +	ret = tidss_oldi_create_pd_devs(tidss, oldi, oldi_tx);
>> +	if (ret)
>> +		return dev_err_probe(tidss->dev, ret,
>> +				     "OLDI%u: Failed to set up the power domains.\n",
>> +				     oldi_instance);
>> +
> 
> I agree with the what this patch is trying to do, but the
> tidss_oldi_create_pd_devs() should be within the if() block above.
> 
> It seems like you are giving the pd_dev of the secondary OLDI TX to the
> primary, but this path would be executed for secondary OLDI TX in clone
> mode as well, whenever it gets supported.
> Which is not ideal, because the primary OLDI TX in clone mode would
> already be taking care of the secondary's pd_dev.
> 
> The conditional block above with,
> `if (link_type != OLDI_MODE_SECONDARY_CLONE_SINGLE_LINK)`, is exactly
> for things that _can_ be setup per OLDI Tx, but shouldn't, like the
> clock and the IO control.

Yes, you're right, I'll move it.

  Tomi



