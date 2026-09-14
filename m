Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A998C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 20:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=; b=SmtTl6HCPEPSCzdTI3LIlU74bg
	ymJT5wxeiFd8beRryp8Dqf2rWrhg0QXgYQqQmqinUhXv27FXitJ7bfc+ux/GL3cVRbqAwpOZTkmxX
	7yP8Ia7WSxt+fyJPGP1CBWrEPverLqpgzpW2htEE+vXj0zCElQq+P7x4zlK+caJkibVPO3OLy4a6/
	aOMrVSCu/4UcM8Hm9FWZENycXJWxo4xbHIMLPAL+MlhM/pipJG1qTOxRc/FUDm3m4SUU8kyEtZ3DO
	X0/dnmSCfHw+dqvGs+gtENr46K5rzXPW5JxkABlwx4xb3oKlaTHTx5lJfCniVx9O0FFWmKrB3/OD9
	Ua1O3Kpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DSv-00000004cVU-0Rey;
	Mon, 14 Sep 2026 20:39:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DSt-00000004cVO-2lTd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 20:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=; b=iYUyB1ynQaO+NVp9mp7kFprxZH
	jMQtp3+7Xax+13F3VEbj5OGy8YcZs+BE7Nwyci+2KHxWj79HXwe/LLWVxRV6HtVV7W8N9qRCruE3q
	qG718bACeVCmyjw8e8uxjVvmBUCzhCUaGMDVRIo5MpLk4cTzFZ/xaE3RfMzdgpPiVqQ2/kwM5/olO
	jSOUaAakqIy7owFSEhwmH0hVhxyxqNpycDUWuHn6n3dghJrd4jwG+PV+6+HcSmDG4Rk4Y8PCAwseU
	wyD/4UJOgBmNy/vLpgc7hZ+7xxER8VeBGHkTmcjUdNwtqjfucwnpPv+slWsj15i8AZ7ZHbVMLNWHA
	AIDG7oaA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6DSj-000000060Wf-2Ujs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 20:39:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYxeL844905
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 20:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=; b=OVTjlI6+q919IrN8
	HWmJfMuqhD6af9p6Alllzrv71c5BiW0nGOMwOfTAi1ho12BQp5D3kiL4sjk5QK3F
	RuJ1tngn/AD6YVH3E0B3e3TIGa6mpAHMCH7krO5xb6l5AMAWGDE5r6/xjPHT5l9B
	E541GwSoMdoCws20sOm9HvB/IK1qwa+rsI4UpdIFpPIvEELIX9KeGHTygqcPzqZR
	ONtmMXgnSxxaWyDnF7Y9aMARlRI8JDXjdTPFLnjUy1d5vzRv0KiSwxB0NHpCVeX6
	werzNw49eEu42KM7gvTwgisUhDI9r7E8e3OW/8flf+6Lng7l0Db/0YFJGyD0+2zH
	FlNXYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f2yuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 20:39:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso1587884a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 13:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789418372; x=1790023172; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=;
        b=a59rlD20EMloCo9mSwNxoT+5fXxAudgFZItV/7cUjKABpiZWKIte2CdujG4ypBU8lp
         9rb74yOXPSTOKigpv+0KLz5EQIjGCUinZ5TTjUN8TZodaRnmfvIDTWAONfUksQ05vgkB
         AwY9UIxzlEcM7hKpaOwTj/richldGZlIIxpiKpdYsZUnXOqlgmjvss+JEbx6NobffwXe
         5TTgfdzG4KaLjO7Em/szq05R3uazcapoWJGn8WJgjzoszNi3q2tSHJZWipyH+y8j0DBU
         tLkSPimBn7lmrBQK4iFIPO4Zg8MdiArC5Pk7mVF399rfuemTJ01Du3h4/4qnW/CrAe3n
         lcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418372; x=1790023172;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=;
        b=jyEfZHiZrU820TaT8Rxbt74X1HCJtJqD+tfa5vKbM3LwCUOJuvDiBvvBjzsvxVvQkS
         MPMDfAhyBcg59lx/P7gsj3i5wDw04B+vR+ZQNJVxLSUCADKXor4U6F7enRgTNLBhFDaP
         NkfOZN+16H1CXHt0eT/fvRGXELZTug2YUNJhswU3KVNVt90AL0VwYfJYL3XyTZOeWAv5
         OceeqExBffNyVp8YQ96hxqQ3B8e8W4NQ6jF+yAd+4fkoj+d68gxC8cPLYUxIE/UBThPV
         zKZFdXuOwosM9ekWpURjlBGQSjXyt6XkrhiOsPVBR948TPNdj98Lltp+5ixmVxZO/L7W
         wPog==
X-Forwarded-Encrypted: i=1; AKwUvBxtRvUN+lQoEXdGcCxMj0lekgeAADJvov0E2BtTNvbKwwwWApZqOXZjmLwLPdGTQp6zGJW7sEz24eO2IzERrj/X@lists.infradead.org
X-Gm-Message-State: AFuF++nT/KGYWV/cH7vcRNFuxe8XmeoRvLJKf8hbP0w3cA8wjKDWEfua
	79f/eEAdI8Z3JEVyr6zUHZ5cBhTa++DaMsy+GywnT5XkWpacM+vsUm6/356+9/yRIb+et+lvCIq
	P3aA1iIs2D2ecBC2k5a5BZOWzwxhSBvRjMxyOw8YxAxsAcchmKhDXrxDwtGxW2ZcNwxJh8igMQQ
	xOvg==
X-Gm-Gg: AYBFou3zaf83TehcUDS5yI842TMSSZRmGJ3rGsG2p3uuDOWs316mT2KY4Z6wbdA3L5e
	tqnNUvilsLNGURSqtrC/h3+omY0gDjDPgqx+K8ndNQD/M+W0bn4zB97f1aenmqLvuRcuuZePPLa
	nmDAmkyefpAWzys+y9SRHghHgkkQ0pkx4TNTQ2La/yWt1Po+lfd4O87C/3ZgqNPArMVzBKVtu74
	DCcES/b1e4V6/CUwLhjCqYa7KzQcjH6WdPabyg/h1pH3O8EDmBq0ucW190e9+IexK5ZrC2SAjhu
	Cl6CJ7FTn4JMxLqcmecyDl9LfT2B7Xo3keBPhsMQdqD4SyLflBDFFKUfJCQFrl5k4jDX6E/2u8L
	l0mERNPWnp4R1C55IgXJPTCIGIm4=
X-Received: by 2002:a17:90b:5806:b0:39d:f024:c7e2 with SMTP id 98e67ed59e1d1-39df024c8d5mr6541341a91.4.1789418371705;
        Mon, 14 Sep 2026 13:39:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5806:b0:39d:f024:c7e2 with SMTP id 98e67ed59e1d1-39df024c8d5mr6541236a91.4.1789418370475;
        Mon, 14 Sep 2026 13:39:30 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b759d0sm28514523c88.7.2026.09.14.13.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:39:30 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:39:27 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
Message-ID: <20260914133927.0000479a@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-3-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-3-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mmuu5TQtAqCkz9IaaDucInHx50m_H8t_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5NSBTYWx0ZWRfX/StDUSug6UjO
 1ocxtwiDT61O58y7GiT1pKdOPkz8bWzg2OIY+fPLBM1XRM12L4b/1sPbBtzcKNaEONNduJRuJ2R
 SLCE1qbYnRc+Zb6G7pu8EE6r/6xFm68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5NSBTYWx0ZWRfX1MhpyT+hlYMR
 Ebp+458ZBlVdjYI0+G7GslNsFe7cMMCu2P62k3ycRxWaAz5FoNorG4ZioZEeExbtjjwOsGRvmNv
 t0Uz5JdvO3DdVDDc+Dq5jJRAGlvuJOQSgNG3J9VmcQpkmsJTyg9D7JzCLV39VRVr3SPXNxJyHDW
 mxF54W2lhFm7B1zZEV+DtNVp/NGC3w5O4LBMyhqO9cLiW2MDds8PVi2t1x8ppFuiJXq712kd8Ia
 ccycpfOI6dVO9iQwd0sQ7FLnjRDNsTwFZ0H164eWb0kX6ItHrt4VXz7uFC5yeD0Z3mWf6aBBTg+
 99rE8TiDkpQVPuOKRS3idjzRPLROmtTHUuxPxvcr6y9/57a7YrDZJ7ubEgzZ3WChgUGl7THFetj
 T+MPx0Hu8bpUTshhmn8xI+kKejHvwUSGEjX8+f62hzLtEJ/qLKYFAGLPJm4dA65FfHqj34AgmE5
 ZJ3bG+fqm1RIar9gQhg==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa85b84 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=hwAxrWSPLhvteNngLDwA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: mmuu5TQtAqCkz9IaaDucInHx50m_H8t_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_213941_827493_07755516 
X-CRM114-Status: GOOD (  28.70  )
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

On Mon, 14 Sep 2026 11:35:06 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
> standalone platform device. Now that the SMCCC core has an SMCCC bus,
> create an arm-smccc-trng device for the discovered TRNG service and convert
> the hwrng driver to an SMCCC driver.
> 
> The SMCCC id table preserves module autoloading for systems where the TRNG
> driver is built as a module.
> 
> The sysfs device path changes from the old smccc_trng platform-device path
> to an arm-smccc device path. No known userspace dependency on the old path
> was found; a Debian Code Search lookup for the existing platform-device
> name/path did not find any users.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Trivial stuff inline - nothing that needs changes
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index bdee057db2fd..756c79204e44 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c

> +
> +static const struct smccc_device_info smccc_devices[] __initconst = {

Ah. With __init_const I suspect the string constant stuff I mentioned in
previous patch won't work anyway.

> +	{
> +		.func_id        = ARM_SMCCC_TRNG_VERSION,
> +		.requires_smc   = false,
> +		.device_name    = "arm-smccc-trng",
> +	},
> +};
> +
> +static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> +{
> +	int ret;
> +	struct arm_smccc_res res = {};
> +
> +	if (smccc_conduit == SMCCC_CONDUIT_NONE)
> +		return false;
> +
> +	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> +		return false;
> +
> +	if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
> +		return false;
> +
> +	arm_smccc_1_1_invoke(smccc_dev->func_id,
> +			     0, 0, 0, 0, 0, 0, 0, &res);

Fits on one line. Up to you though as maybe it's cleaner to have all the numbers
start on a new row.

> +	ret = res.a0;
> +
> +	if (ret == SMCCC_RET_NOT_SUPPORTED)
> +		return false;
> +
> +	return true;
> +}
> +
>  static int __init smccc_devices_init(void)
>  {
> -	struct platform_device *pdev;
> -
> -	if (smccc_trng_available) {
> -		pdev = platform_device_register_simple("smccc_trng", -1,
> -						       NULL, 0);
> -		if (IS_ERR(pdev))
> -			pr_err("smccc_trng: could not register device: %ld\n",
> -			       PTR_ERR(pdev));
> +	struct arm_smccc_device *sdev;
> +	const struct smccc_device_info *smccc_dev;
> +
> +	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
> +		smccc_dev = &smccc_devices[i];
> +
> +		if (!smccc_probe_smccc_device(smccc_dev))
> +			continue;
> +
> +		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
> +		if (IS_ERR(sdev))
> +			pr_err("%s: could not register device: %ld\n",
> +			       smccc_dev->device_name, PTR_ERR(sdev));

Could be friendly to anyone reading this and use %pe.  Up to you.

>  	}
>  
>  	return 0;


