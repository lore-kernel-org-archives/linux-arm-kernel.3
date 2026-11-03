Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF042606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cuAE4ftP;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=VOJbyUkE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9HFajkMdiw6Cxr5bhVQtWouD1V5S9+5PzrpHwKVgix8=; b=cuAE4ftP938/Ip
	Jhqxb+DcI+P8Hd9f19T5Qn32uI8AcOv9mcZlEqVAA27u/rfc12r0DNqIPz7W0+6LROrCgDgMYsV4A
	uAW7ovLaAJN4QwZoRLxamNcUtke2oIz/wQSZuu/K83byIWQL81MP/f9xoFOwhPBEMD5M4g6pzr7Bx
	GHpnFoDjxDXOnTTEmFiSjX21I3xmBXTkr1Jvu1S74uBTORazDFvfkIFshnMorowS08/b/fRcZRqsL
	96z3H+MvDnVavAsOBhBr75hrQ6tmRWrpEA2Tyy7bDUn4Q9U1eTwYpeQFPaTwLIsPsE6CvBlWlsFmZ
	EcmprMQ0hINzcanoc/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9mL-00000001Wc9-2fRl;
	Tue, 03 Nov 2026 08:22:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9mI-00000001Wbb-3cvQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:22:00 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F223A7E1;
	Tue,  3 Nov 2026 09:19:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793693979;
	bh=GP8xPnEIMDQsMAKAderpcsLm7MDDhpE8epRfiUMVDLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VOJbyUkEBoZ5roG+T9bTHvtDR1wsdC/r/7TbTVX/gluzsDnNhOMw7fHFa737P4LTT
	 0gc2H/lDKEjmHQ0z0212jwhNK1hbWJIZdr4j7JU1jLYL70AZygTKAsFMT66DJv6aJ3
	 c+y+zgOWtPZh3clH3fe/bufXAA8tz/TNnkQHk3IU=
Message-ID: <7688e746-b4b3-4856-8e67-6c8ed21d10c1@ideasonboard.com>
Date: Tue, 3 Nov 2026 10:21:53 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] drm/tidss: Add support for AM62P display
 subsystem
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
 <20261029-beagley-ai-display-v4-12-dc7f2b532478@ideasonboard.com>
 <5782a7a2-3fb4-4d74-aae9-e1ff0d0d4393@linux.dev>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <5782a7a2-3fb4-4d74-aae9-e1ff0d0d4393@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_002159_080167_6E73B411 
X-CRM114-Status: GOOD (  23.27  )
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

On 02/11/2026 16:02, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 29/10/26 10:18, Tomi Valkeinen wrote:
>> From: Swamil Jain <s-jain1@ti.com>
>>
>> The DSS controller on TI's AM62P SoC features two instances of the TI
>> DSS. Each DSS instance supports two video ports, similar to the DSS
>> controller found on the TI AM62X SoC. This allows three independent
>> video streams to be supported: OLDI, DPI, and DSI.
>>
>> Since the DSS instances on AM62P are architecturally similar to those
>> on the AM62X DSS controller, the existing dispc_am625_feats
>> configuration can be reused for the AM62P DSS support.
>>
>> This commit adds the necessary device tree compatibility entry for
>> "ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
>> thereby enabling DSS support on AM62P devices.
>>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> 
>> ---
>>   drivers/gpu/drm/tidss/tidss_drv.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
>> index 44b0b009c29a..8e3cbfb5ef87 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.c
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
>> @@ -240,6 +240,7 @@ static const struct of_device_id tidss_of_table[] = {
>>   	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
>>   	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
> 
> On a separate note,
> 
> Now that `vp_bus_type` support has been dropped, the only thing
> different `dispc_am62a7_feats` has from `dispc_am625_feats` is the
> subrev macro.
> 
> The DSS in AM62A7 SoC is functionally same with that in AM625 SoC; the
> only difference being the absence of both the OLDI TXes in AM62A7.
> 
> The dt-bindings enforce that rule.
> 
> The only place subrev DISPC_AM625 is used, and subrev DISPC_AM62A7 is
> not, is for an OLDI reset done log print.
> 
> if (dispc->feat->subrev == DISPC_AM625 ||
>      dispc->feat->subrev == DISPC_AM65X)
> 	dev_dbg(dispc->dev, "OLDI RESETDONE %d,%d,%d\n",
> 		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(5, 5)),
> 		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(6, 6)),
> 		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(7, 7)));
> 
> Should we consider some workaround for this print, so that we can
> entirely drop `dispc_am62a7_feats`?
Indeed, this allows us to do a nice cleanup. Good catch! I think it's 
fine, we'll just print those bits on AM62A7, I don't see any harm in that.

  Tomi


