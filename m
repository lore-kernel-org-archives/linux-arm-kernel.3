Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CD4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPxC5gR4RA6GtliDWzNm8WFvT9nOrcyxkhsvtHvBT8I=; b=d/w0ygMTLIym6oydR8XPXcIkEQ
	RkVWkoPsZQsRpu3w1gvQgU7VyNAltAVqeUZDhuggNevw0/AQbAUFIqXB3xxcl1b2NcsCPcGWbmRdZ
	JuAMNkVS/EwfgcBHmDzFgWkkSmtEsBUYzQ+7pAD5Q9MlZtIDk+2sbpPvSWFBPd0SXdgvk8BWHQHCF
	B12VnryTi8L0Y2aAtPxNmx17MGC0CEZ2dBzyNW5MKHVuvvGyAt4goVv5hLwN3aQozbXxb5zipB43a
	ksoRqlnB5qrtR26fxvjP+tEQnwaIqzLjmstQsk4hREWx/U8acZPqRxzH0sNjg8RD/gjVg4d8foSSd
	lDdCsOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w0c-0000000E55P-3sHe;
	Thu, 24 Apr 2025 12:48:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uAs-0000000Dkog-0UPQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:51:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OABWls005875
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 10:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPxC5gR4RA6GtliDWzNm8WFvT9nOrcyxkhsvtHvBT8I=; b=MWbdLNMJbmPjvCjX
	Ln11rG8o0Jsba7zYTQ03ZCXaD6XpYPvq8lB2oCEA6lx7VA0/ZOS1zN7J1qrG5bvC
	ybSQZ2FPdurZBK5H1IB9HU95pzpjj6w042MOzD8Xnf6iP7+27agis8r4E7ZrV1cr
	XMOMspnD3K9btpbxEC4qHnqMMPAfB1Yjm3BrvxcNhksgi2a4p7V6HtEHgRmHaft7
	Vok7UMrhkj3s/x8FVegA7JQHcWdKxg+7N9qMZqh+mWaORB4CMjG1cCIYxJXcZUTm
	3pyJKgkkC3uHbUq1hHaYJ4sCkBOlPmZQODJeMG4yvhTRcgCdC/rWDMlX3an/azx4
	nC+yIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0591q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 10:51:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so163784385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491880; x=1746096680;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPxC5gR4RA6GtliDWzNm8WFvT9nOrcyxkhsvtHvBT8I=;
        b=B0BKf64VPFySZqY/aL0pOfYpKawlTu7bzltydKU6AEywWiDCa8GHyOMZZw9srM3PBr
         vdXCa+s0J+xNRMwDIVnV5FTZt/3WcSjTtkVlZMPCLKcET4zbUqC5zSTG0yk89NDnPb9A
         ALGCcBqNm9wce8DxwGOV1S/i9179DdM3Kip8EneIR9njkFonBbyMbskp4ZBOmUAj2mdp
         fPtQGMxHsP6/SIz77mSdNWZJu3jZzQTdEucrmzddt9+y0i8zbMDVULG/eQ7JMx7GajaE
         nErTu19uqASdHkP8SbOHOlFh3KZNtge+it3OmQZCLQh0OmmU2eEM45vruodCD1g7zwSi
         2P4A==
X-Forwarded-Encrypted: i=1; AJvYcCXiavhF6tmOyOhmfVONmrQts9mxREMuBtsZFsNtO5Pzm7EauGMgk5dMQhp+LTTGV+5znK2fWGTbPTZFXPRm/O5E@lists.infradead.org
X-Gm-Message-State: AOJu0YzgokBRCHRWP95vgNELdVY3HmZL2DrjzsythHIaEsMHPdxVmEh+
	7rmkuMQoCNxxTLzLBwDxB7rStosiUI3AFtjteorO27t9EY21IDL7MdsGFoVI7uwPlhNF6zCdFxT
	3IrPwjTHKAreRPaV7r75+n3mQLhpl2qAA0gNgu/7DXmLQqhe7SFgJPaTcxBeNJBdoPKy7DE7J7w
	==
X-Gm-Gg: ASbGncstX2nzgvKCYRN92Mtb9fCbi0OcAISiccnaYqldft2dZSYlZHNKLOQEzxxDqg7
	8N0dR8aZpY/3cg+6jXvL2ESCbh3LhOcSWmH/7EgZZP6gGgGIaDsQfqGr7xqUb69nPLSu4PNy0Zm
	Cpw8pDugHUqFLV56iIVyEqVBWdxhBOvHel2JhxQAQRqKJ3DPSmDdTC3bAEpQIZ1zUv/x/pQ0nNb
	GqIw8AFYeGTEeACfppyOfc2IoBQ9L7+Wiq8m5VEIJwARTTm50zOyHpK4AJjV4RYAbgssWdR9cWT
	WNSskQVlQX+nCAMm0xOxgQMQE3mIOpq6Yuie4xxkkPH9taJ2S7wKKS+Gqwj/12s2ziB3dhbGJt0
	=
X-Received: by 2002:a05:620a:414c:b0:7c9:574d:a344 with SMTP id af79cd13be357-7c958659e5amr227774885a.25.1745491880212;
        Thu, 24 Apr 2025 03:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh5n407lbxSXdQd+Or+bg7Zig/W2pF+NxXoVNS7+WNM269eoSPy0vOUVmV16jrZ6SmVs9Qug==
X-Received: by 2002:a05:620a:414c:b0:7c9:574d:a344 with SMTP id af79cd13be357-7c958659e5amr227772185a.25.1745491879846;
        Thu, 24 Apr 2025 03:51:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7dc7sm188726e87.221.2025.04.24.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:51:19 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:51:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH 6/7] platform/chrome: cros_ec_typec: Add support for DP
 altmode via drm_bridge
Message-ID: <npnpujjfonvzhf5c4upgajhx6hu5uqmerewmbqprvl7a3xrqgm@datubwgyucby>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-7-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416000208.3568635-7-swboyd@chromium.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3MiBTYWx0ZWRfXy5X6JiSfhYQ9 FWeKEstOwbJdfhqAC/X2sZTb9J7J/CahznAiToF72NUQHKU7t2NfTCyv1ZATH+89n9WhXecVAwa OUmVuJ05TyCSy/Eq4eNFRwJUJPdYpYLZv/Mi9LZ0KBvvykHosAhN/Orf4runyFc+6jRMk4zhzDz
 PSixvhdyTk7d6bR9tharycuS9HlMOS4jvYO42FvW92o9ASK4NltPNcMB7zsM3h+CnGz/SFYb7gX CLbwnI+IJi2FpogrvNBu95GNJkkhMAo+vPYCgv3LGK7NPVzW0xbXhzrmBjOobBe9Rz/hjM5+Btl Qw1NOhYa1NJhiq8l7KIQRsBX4IXkXdWL2i4M00DXughlEu2ZaDq27Hu7Pr/4qdggjtDBQwSRqGS
 cyRf1SPbcjKUmCFN7Ve/XDRXbkXGL5XnzGkTJmv1hNd4QzxSxAxwcgQDaCzyWksRUy+xxT7S
X-Proofpoint-GUID: 07kcX9KWM0RP45_G1PoT00k_N1BY04st
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a17a9 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=37Y-6JeU6fprrkKw-18A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 07kcX9KWM0RP45_G1PoT00k_N1BY04st
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_035122_284229_40A95970 
X-CRM114-Status: GOOD (  38.35  )
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

On Tue, Apr 15, 2025 at 05:02:06PM -0700, Stephen Boyd wrote:
> On Trogdor platforms, the USB DP altmode is entered and exited by the EC
> depending on if DP altmode is possible and if HPD is asserted for a
> port. Trogdor has two USB-C connectors but the AP only supports one DP
> controller, so the first USB-C connector to assert HPD "wins". The DP
> controller on the AP is fixed to output two lanes DP that goes to an
> analog mux that steers the DP lanes to one of the two USB-C connectors.
> The HPD state in the DP altmode is "captured" by the EC and redriven
> from a GPIO on the EC to the AP's GPIO that is muxed to the DisplayPort
> controller inside the AP SoC. This allows both HPD high/low and HPD IRQ
> to be signaled from the EC as well as making DP altmode possible on
> either USB-C connector except at the same time.
> 
> Add a drm_bridge to the ChromeOS EC driver to represent this analog mux
> on Trogdor and teach the kernel that DP altmode is using this DP
> controller on the AP. When the DT node has a graph binding, we assume
> that we're muxing DP to one of many USB-C connectors and we terminate
> the bridge chain here. In almost all cases we want this bridge to be the
> one that signals HPD because the EC is the one managing HPD and
> redriving the GPIO, except for in the case that the DP altmode driver is
> enabled in which case HPD will be signaled with
> drm_bridge_connector_oob_hotplug_event(). Unfortunately Trogdor EC
> firmwares have a bug where HPD state isn't discoverable properly, so we
> skip signaling HPD in that case if the "no-hpd" property exists in the
> node.
> 
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/platform/chrome/Kconfig         |  1 +
>  drivers/platform/chrome/cros_ec_typec.c | 50 +++++++++++++++++++++++++
>  drivers/platform/chrome/cros_ec_typec.h |  7 ++++
>  3 files changed, 58 insertions(+)
> 
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index 1b2f2bd09662..0ed8637b8853 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -247,6 +247,7 @@ config CROS_EC_TYPEC
>  	depends on MFD_CROS_EC_DEV && TYPEC
>  	depends on CROS_USBPD_NOTIFY
>  	depends on USB_ROLE_SWITCH
> +	depends on DRM_BRIDGE
>  	default MFD_CROS_EC_DEV
>  	select CROS_EC_TYPEC_ALTMODES if TYPEC_DP_ALTMODE
>  	select CROS_EC_TYPEC_ALTMODES if TYPEC_TBT_ALTMODE
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 2cbe29f08064..27324cf0c0c6 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -9,6 +9,7 @@
>  #include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
>  #include <linux/platform_device.h>
> @@ -16,6 +17,8 @@
>  #include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_tbt.h>
>  
> +#include <drm/drm_bridge.h>
> +
>  #include "cros_ec_typec.h"
>  #include "cros_typec_vdm.h"
>  #include "cros_typec_altmode.h"
> @@ -337,6 +340,9 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>  	u32 port_num = 0;
>  
>  	nports = device_get_child_node_count(dev);
> +	/* Don't count any 'ports' child node */
> +	if (of_graph_is_present(dev->of_node))
> +		nports--;

Should this be a separate commit?

>  	if (nports == 0) {
>  		dev_err(dev, "No port entries found.\n");
>  		return -ENODEV;
> @@ -350,6 +356,10 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>  	/* DT uses "reg" to specify port number. */
>  	port_prop = dev->of_node ? "reg" : "port-number";
>  	device_for_each_child_node(dev, fwnode) {
> +		/* An OF graph isn't a connector */
> +		if (fwnode_name_eq(fwnode, "ports"))
> +			continue;
> +

... together with this chunk.

>  		if (fwnode_property_read_u32(fwnode, port_prop, &port_num)) {
>  			ret = -EINVAL;
>  			dev_err(dev, "No port-number for port, aborting.\n");
> @@ -417,6 +427,42 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>  	return ret;
>  }
>  
> +static int cros_typec_dp_bridge_attach(struct drm_bridge *bridge,
> +				       enum drm_bridge_attach_flags flags)
> +{
> +	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
> +}
> +
> +static const struct drm_bridge_funcs cros_typec_dp_bridge_funcs = {
> +	.attach	= cros_typec_dp_bridge_attach,
> +};
> +
> +static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
> +{
> +	struct device *dev = typec->dev;
> +	struct cros_typec_dp_bridge *dp_bridge;
> +	struct drm_bridge *bridge;
> +	struct device_node *np = dev->of_node;
> +
> +	/* Not capable of DP altmode switching. Ignore. */
> +	if (!of_graph_is_present(np))
> +		return 0;
> +
> +	dp_bridge = devm_kzalloc(dev, sizeof(*dp_bridge), GFP_KERNEL);
> +	if (!dp_bridge)
> +		return -ENOMEM;
> +	typec->dp_bridge = dp_bridge;
> +
> +	bridge = &dp_bridge->bridge;
> +	bridge->funcs = &cros_typec_dp_bridge_funcs;
> +	bridge->of_node = np;
> +	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
> +	if (!device_property_read_bool(dev, "no-hpd"))
> +		bridge->ops |= DRM_BRIDGE_OP_HPD;
> +
> +	return devm_drm_bridge_add(dev, bridge);

Could you please use aux-hpd-bridge instead?

BTW: what is the usecase for the no-hpd handling here?

> +}
> +
>  static int cros_typec_usb_safe_state(struct cros_typec_port *port)
>  {
>  	int ret;

-- 
With best wishes
Dmitry

