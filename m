Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F548CFA452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FclauO0bzswyc+MAq1B6mcZjgSqLwXz40OeffNV4QSo=; b=bYoTwKiHMSRzU00SFs2mqrmyg4
	KcOad+GTD2kunyhOcveznCY4I1567ljs0es4eiXyXx8XM1YUgTJ+0fFrZZvXQNzc56tTgRDBv8r8n
	qwiMvxNNkDN583tpy54lJ5mTT7rE2g5UA8IKXsd3Ys72nkxIi/O5YhvZQP9J4/ng6uFMGdttfY9OD
	J/27fm87QrVgmFz9OrZZzu20brddcsbcNaAdRtk3OPA6ck/lwIS9Lz3FZ5lHh+BwA0NHDt8OouW/6
	/t1vJM443uf7YlQdky5sEt4VNrFQOrkVrooIz5b9XZFxDbYn6Po1AtFA/aOxptqXCFSpJd3LChkYA
	AdY8yLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3exK-0000000FLIC-3k05;
	Wed, 23 Oct 2024 17:15:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eFv-0000000FAzK-3seI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FclauO0bzswyc+MAq1B6mcZjgSqLwXz40OeffNV4QSo=; b=gjYUw6ahshs+DP88nEjaN03XeC
	MHp4u3AEDqNPeWuokXl/LPGR7gTyKReLZxKOzj9rGqRw7Joz67O4b3v4HzxtiFkKWeQtKQ9FJq6OD
	n3K7ZTMuIkg1Jr1HyXHijWKZMrY9OGXnlKoIRpjc7KGmgOAvgEaCv4buVY50IZoVuL/ixAIA5Os/F
	POIR+4vR4luHGQ5D6QbhjOmR6QEaYPupQ9FNsVehXpn11bOk1Jx504b0W/yqjcgfe2HiezKKdxpCU
	bV+yQydKyVcq875+i+u/TNnN3fxNHQpNK3H+wPfxwnQ8ZbHmbR6STojyoq3e91/JHEOW+79dvTSnE
	eIJG0iaw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eFs-00000008SMA-2SPO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:30:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9HSdU026325;
	Wed, 23 Oct 2024 16:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FclauO0bzswyc+MAq1B6mcZj
	gSqLwXz40OeffNV4QSo=; b=VByJhhXcpOkf9T39w00mf0miuEAKw/JHHqer7c1L
	2N5Jk/WOpsUODU618CYflAq4w00gsqbykXoaRga1sXnGsvbmWCeqT1HUcsNXiDfX
	QI55AM539K+sDmGX62BCXEUjyndoAh7SkD0wqQyiXZYMQXNZsvs182pt7Tn0SwN2
	F/7S90tXqtyIab5aY7gsj38fCl/GjUjJGtIgcNzXwAbQEdR415YuI3UPcjR5Et+I
	way3sS2qxUOUTFz0hO2dj+O5MSI4GF2hqiT2p/dsW+3DB1YPZPvA9zv1z9Rd8U+w
	U8crKjgM7pjv+75xNAPwwsLM7xw7VVdwlX+yEcIMp0SLeg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em40aut2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 16:30:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NGUNw8012804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 16:30:23 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 09:30:22 -0700
Date: Wed, 23 Oct 2024 09:30:21 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>
CC: Andy Yan <andy.yan@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Olof Johansson
	<olof@lixom.net>,
        Rob Herring <robh@kernel.org>, Sebastian Reichel
	<sre@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon
	<will@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Shivendra Pratap <quic_spratap@quicinc.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v6 3/5] firmware: psci: Read and use vendor reset types
Message-ID: <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com>
 <20241018-arm-psci-system_reset2-vendor-reboots-v6-3-50cbe88b0a24@quicinc.com>
 <CAE-0n515sUkmTWptgY8pOaMDBPfDp5pZBy9Nby+4cMdMAnAZfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAE-0n515sUkmTWptgY8pOaMDBPfDp5pZBy9Nby+4cMdMAnAZfA@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RVMuLpnaxcrO0emm38nvEuLCDeeWvOiG
X-Proofpoint-GUID: RVMuLpnaxcrO0emm38nvEuLCDeeWvOiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_173040_999853_C9C50CE3 
X-CRM114-Status: GOOD (  31.25  )
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

On Fri, Oct 18, 2024 at 10:42:46PM -0700, Stephen Boyd wrote:
> Quoting Elliot Berman (2024-10-18 12:39:48)
> > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > index 2328ca58bba6..60bc285622ce 100644
> > --- a/drivers/firmware/psci/psci.c
> > +++ b/drivers/firmware/psci/psci.c
> > @@ -29,6 +29,8 @@
> >  #include <asm/smp_plat.h>
> >  #include <asm/suspend.h>
> >
> > +#define REBOOT_PREFIX "mode-"
> 
> Maybe move this near the function that uses it.
> 
> > +
> >  /*
> >   * While a 64-bit OS can make calls with SMC32 calling conventions, for some
> >   * calls it is necessary to use SMC64 to pass or return 64-bit values.
> > @@ -305,9 +315,29 @@ static int get_set_conduit_method(const struct device_node *np)
> >         return 0;
> >  }
> >
> > +static void psci_vendor_sys_reset2(unsigned long action, void *data)
> > +{
> > +       const char *cmd = data;
> > +       unsigned long ret;
> > +       size_t i;
> > +
> > +       for (i = 0; i < num_psci_reset_params; i++) {
> > +               if (!strcmp(psci_reset_params[i].mode, cmd)) {
> > +                       ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> > +                                            psci_reset_params[i].reset_type,
> > +                                            psci_reset_params[i].cookie, 0);
> > +                       pr_err("failed to perform reset \"%s\": %ld\n",
> > +                               cmd, (long)ret);
> 
> Do this intentionally return? Should it be some other function that's
> __noreturn instead and a while (1) if the firmware returns back to the
> kernel?
> 

Yes, I think it's best to make sure we fall back to the architectural
reset (whether it's the SYSTEM_RESET or architectural SYSTEM_RESET2)
since device would reboot then.

> > +               }
> > +       }
> > +}
> > +
> >  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> >                           void *data)
> >  {
> > +       if (data && num_psci_reset_params)
> > +               psci_vendor_sys_reset2(action, data);
> > +
> >         if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> >             psci_system_reset2_supported) {
> >                 /*
> > @@ -750,6 +780,68 @@ static const struct of_device_id psci_of_match[] __initconst = {
> >         {},
> >  };
> >
> > +static int __init psci_init_system_reset2_modes(void)
> > +{
> > +       const size_t len = strlen(REBOOT_PREFIX);
> > +       struct psci_reset_param *param;
> > +       struct device_node *psci_np __free(device_node) = NULL;
> > +       struct device_node *np __free(device_node) = NULL;
> > +       struct property *prop;
> > +       size_t count = 0;
> > +       u32 magic[2];
> > +       int num;
> > +
> > +       if (!psci_system_reset2_supported)
> > +               return 0;
> > +
> > +       psci_np = of_find_matching_node(NULL, psci_of_match);
> > +       if (!psci_np)
> > +               return 0;
> > +
> > +       np = of_find_node_by_name(psci_np, "reset-types");
> > +       if (!np)
> > +               return 0;
> > +
> > +       for_each_property_of_node(np, prop) {
> > +               if (strncmp(prop->name, REBOOT_PREFIX, len))
> > +                       continue;
> > +               num = of_property_count_elems_of_size(np, prop->name, sizeof(magic[0]));
> 
> Use of_property_count_u32_elems()?
> 
> > +               if (num != 1 && num != 2)
> > +                       continue;
> > +
> > +               count++;
> > +       }
> > +
> > +       param = psci_reset_params = kcalloc(count, sizeof(*psci_reset_params), GFP_KERNEL);
> > +       if (!psci_reset_params)
> > +               return -ENOMEM;
> > +
> > +       for_each_property_of_node(np, prop) {
> > +               if (strncmp(prop->name, REBOOT_PREFIX, len))
> > +                       continue;
> > +
> > +               param->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> > +               if (!param->mode)
> > +                       continue;
> > +
> > +               num = of_property_read_variable_u32_array(np, prop->name, magic, 1, 2);
> 
> ARRAY_SIZE(magic)?
> 
> > +               if (num < 0) {
> 
> Should this be less than 1?
> 

of_property_read_variable_u32_array should return -EOVERFLOW (or maybe
-ENODATA) if the array is empty. I don't see it's possible for
of_property_read_variable_u32_array() to return a non-negative value
that's not 1 or 2.

> > +                       pr_warn("Failed to parse vendor reboot mode %s\n", param->mode);
> > +                       kfree_const(param->mode);
> > +                       continue;
> > +               }
> > +
> > +               /* Force reset type to be in vendor space */
> > +               param->reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic[0];
> > +               param->cookie = num == 2 ? magic[1] : 0;
> 
> ARRAY_SIZE(magic)?
> 
> > +               param++;
> > +               num_psci_reset_params++;
> > +       }
> > +
> > +       return 0;

