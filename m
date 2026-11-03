Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443BA606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=obfDW2Kk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jLp0siYs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZWwFuZ0h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5vu540DCAHNR7Dg2bFFUUYAP8YFFyB1ksBLxdAK3dqI=; b=obfDW2KkCxahVk
	yNcj28+FeqOlzuCkgDbm78tjZph5EOoVvSfMPhoPGkIc3Gj/3mTBxM95TpnZKfds26XDf5WBrEVEt
	++RR0u+QnEmt6KaNwrsDaASxwZHfcaCIBf2+b0XYVqPYScO+kUJIIAiek97ju+FtEMbNY+lYHdPq4
	e+pAS/icUdN3w5NQ6f0X1VDs5OqC6SZykvi8KCAzVOgowT43UITZpLaHza4YPBlS5LwGrtIr/GCHD
	BTtS+lNwjedDPDN2miBtTo8L8njV/Dqcl+IQyr7hLisAYq6BQZcpRkusA/9Ur+MCwEjvJFWXVk0ba
	zvIti9xYMPMhRNrT5LOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONPX-00000003uFU-0JbC;
	Tue, 03 Nov 2026 22:55:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONPU-00000003uEk-0JP9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:55:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKpXJ3993774
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 22:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vu540DCAHNR7Dg2bFFUUYAP8YFFyB1ksBLxdAK3dqI=; b=jLp0siYs24jiykur
	zxQzv9pTq9ogkUhtCM8SbZyUdidoHRVVOVuj+RwHCteLXOlAd5VrWyRVPCCnfziZ
	XwchQce1ZXTKtV8FwllfjLfoPYdNQAKEXqR4PdSN4tk6rmDJlm5fvzA21hDB8Z0B
	gvXVeviawB108z+4JG4gPvvBNF/bUD/xKvnvlpWkgADPlmQk9zZWyUE3inaf04TF
	S6pnnxJqwk7Jy1rQpYegPXHt+SSUFYi32vaHCunSIkoYG1J6PhvDMuY1IGuAK8xo
	egMBeVlWtnfbZpT4Y2UCyYl3hhMVEOeZUKmOkZQ+WjmuU8parznvB9+SygC4jP3y
	PzCnYQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ngtre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 22:55:19 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-85c6a056128so89150a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793746518; x=1794351318; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5vu540DCAHNR7Dg2bFFUUYAP8YFFyB1ksBLxdAK3dqI=;
        b=ZWwFuZ0hNEguUy5QxrAqqik34P43MRRWKo4xpWEf7wTf/KerOtIqzmju7peyaUyWd8
         YKTaCESmNJTs+b0S/9bk8A1+ulXut6tkiJCi2DJmvol++yvT0l7M1Du1H3UKXS/kxwJU
         UkVP6AOb1ythVlFwqBeNtyiqtrXH9dc6UKp8qazePw1CUw1Hdrvq4bkEj4BnaNk7f7jV
         xKwWL1Oo8aaE4jg+dA4ciQe7Ns2h/dvFbFuPhA562h2nglpTKY1qWJ/O5ncjPk0iEVm4
         OmHUhdHsJ7zmncqB+Gg2995hYgiYWX5bubzt+d5fiAt2L55LWKzkZodKgH+x7kTROEm1
         EhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746518; x=1794351318;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vu540DCAHNR7Dg2bFFUUYAP8YFFyB1ksBLxdAK3dqI=;
        b=NTrYFy3TKbby4NRDGUAo9qgk1da9AO3zjSWwzv3T2jaDo4XvNNawnp/zX3b0GkwC7c
         EkGH9+Dsr/vju+VfLPYarIMvt/o9AjzMdJw4BDVknRyUeW28AJKcE/LlGYX79eOuF2FD
         wD0r32NX/Dk1mJsa1HF+mykb7/ZD55JVswYg6+h7rKl3tbMh2QZHtP7q5SaTur69+Gvx
         nIWHjUQwt/WbkN0zy/zbhnoGgXe2dp3qv4Ug+VnpCiv8B0wMvnuVgK/Y9Ckrh3mgZM3s
         /foqhCLPjTbYakmB1LCHtRnYbZ/jzQG5IedIcE10yrBZF2XqE4WC10jlBk7r7Xp4s9Jz
         zJWg==
X-Forwarded-Encrypted: i=1; AKwUvByTQYaqJBpN7pU98o07dLw9f6MaIPguE92PKspe/od5rGMvkzM8/gxeIv7LZJ3+/leLVG8VxMfBPjnwur5eCQ41@lists.infradead.org
X-Gm-Message-State: APuU4Z/VgpcBNvdTJH+smiWdhpaTOZOjfDyEPzaFMctbSVRVILmTese7
	lQWsVu9GORjfm19o8PDFtmfccLZ3CcoaKZHGC4IS3yy+pX7jerEuUOjLBAvzXwZfTiaeA94rbu7
	hKDqxlvHXba5wR42sCuerJwOPOR6GYT3IBYK9n63p7odHVwRZTOn9/ekioUYPs19LpNMetI5pN4
	GHdQ==
X-Gm-Gg: AYBFou1qT9a7AAL2cUKeqQkyHvMV6VWhoLvCdWAnzNA5dsTaKQ0tRT1nTqNTSA2fGyI
	Hkf0UjFzRatM4OjS3STsW9luoIS4gnKFa+gQGtibcb42vJZ4B0TVlpdWAsBbp9XoqdErLrO43L5
	KeophzpGHXyiQBF1RpPFmoaHhpbESFX07jdOUcrzVVZE+5hShqoAR3XXvYErDsTxS9q03fq8/H3
	5fITnvf5kdoYcHqcpinF3G+UkJ0ymHdDHihiGlicnvETbe3Zt28W3fSRykjWXi4/Wy49ecr8j7e
	gNztFobY5ErDKwX+6GQCLtiHD+CvVfoGu4D2BG9+fce939dfZ9p5iicQ1nNu/dLRaXVInGZWrzg
	MMa82ft5HwYiHsK9gTZKfGN77QM3yaoxGOM0M1xFroXA/h5+XCvmk77f6xmk9Wre+hsVIeugx8K
	4uQDBJyrYW5oOI31vxjcXDqhxGkw==
X-Received: by 2002:a05:6830:680b:b0:822:e9bf:6445 with SMTP id 46e09a7af769-85d364b9a22mr11312085a34.9.1793746518250;
        Tue, 03 Nov 2026 14:55:18 -0800 (PST)
X-Received: by 2002:a05:6830:680b:b0:822:e9bf:6445 with SMTP id 46e09a7af769-85d364b9a22mr11312074a34.9.1793746517810;
        Tue, 03 Nov 2026 14:55:17 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e170absm449988a34.15.2026.11.03.14.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:55:16 -0800 (PST)
Date: Tue, 3 Nov 2026 14:53:35 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jamie
 Nguyen <jamien@nvidia.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Dat Mach
 <dmach@nvidia.com>
Subject: Re: [PATCH 2/2] ACPI: FFH: Support FF-A direct request 2 calls
Message-ID: <20261103145335.000026ea@oss.qualcomm.com>
In-Reply-To: <20261103173907.1996118-3-sudeep.holla@kernel.org>
References: <20261103173907.1996118-1-sudeep.holla@kernel.org>
	<20261103173907.1996118-3-sudeep.holla@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MSBTYWx0ZWRfX66yYV4Sy95al
 2Mf/GLCihpdmwFs5MRDE0lysivbhSU+vdClHbxaJzofVsYKKS47rWm/UVa7MVojqJooc0AwzRC8
 8xjAXWEfneJtT8JU38NVW+0F0SlkJXb3Nhhi7Rr6e2OGJbrUkzY+QYljbm1dzWMScknHgOhA+Fy
 gbaBFEz8sw1Yrf6IavqW+RPWnEUwmqRoQYZwxR5XGdPioyYuo9arsWfKZXB2FeaAHOvSbmgiEke
 nYjbwx56GXoFiObawX78OWxVdB4ul+Aj+EU4gyKyMhcSQQ/Elntqtp9+62khidcb0udhaCGwSTE
 7S5KT2t57wWIvJuak4YkSCNi3MXLKLRXKdD9XQW7j/I4e76PMaOyBwUbrpDhE9hmvuR59PzvhEe
 jFgxJRqGpMwnOy+OliRjLYuXeSc770locpTjE7ThEuwtOrbso8r8OM2XAWGZMOF4RHYFMSd6yFL
 4Sa85uOEiLD6WMEwLSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MSBTYWx0ZWRfX9Mv41sB72vKB
 wBz/bfWq9QaeHSlvIlGsiWshGXeK410KZBZOq54U8cLRcdYtXTWhGQxYN2Q3OWe35qzLwFuAh9K
 b5PjwFIYAGSAmqn2FB/s0JXR/wYspdA=
X-Proofpoint-GUID: aaMCgKAeTDcFwV_RFQqhkFZXlSRodJuv
X-Proofpoint-ORIG-GUID: aaMCgKAeTDcFwV_RFQqhkFZXlSRodJuv
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea6657 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=-0h4ovkggksBOsavXOYA:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_145520_130656_1877E9DA 
X-CRM114-Status: GOOD (  23.97  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue,  3 Nov 2026 17:39:07 +0000
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Arm Functional Fixed Hardware specification v1.3 defines FFH
> OperationRegion offset 2 for issuing FFA_MSG_SEND_DIRECT_REQ2 calls.
> The arm64 FFH handler currently supports only generic 32-bit and 64-bit
> SMCCC calls, so it cannot implement this standardized interface.
> 
> Add a standalone FF-A path using the existing SMCCC conduit. Negotiate
> FF-A v1.2, discover the sender endpoint with FFA_ID_GET, and use either
> the receiver supplied by firmware or resolve a unique receiver from the
> service UUID with FFA_PARTITION_INFO_GET_REGS.
> 
> Convert the ACPI ToUUID representation to the FF-A register encoding,
> construct the direct request, resume interrupted or yielded calls with
> FFA_RUN, and return the defined FFH status codes to AML.
> 
> Register-based partition discovery avoids RX/TX buffer ownership and
> keeps the FFH implementation independent of the Arm FF-A transport
> driver.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Hi Sudeep,

I was curious so took a quick look. Some drive by comments inline.

thanks,

Jonathan

> +static int acpi_ffh_ffa_features(struct acpi_ffh_data *ffh_ctxt, u32 fid)
> +{
> +	struct arm_smccc_1_2_regs args = {
> +		.a0 = FFA_FEATURES,
> +		.a1 = fid,
> +	};
> +	struct arm_smccc_1_2_regs res;
> +
> +	acpi_ffh_ffa_invoke(ffh_ctxt, &args, &res);
> +	if (res.a0 == FFA_ERROR) {
> +		if ((s32)res.a2 == FFA_RET_NOT_SUPPORTED)
> +			return -EOPNOTSUPP;
> +		return -EINVAL;
> +	}
> +
> +	return res.a0 == FFA_SUCCESS ? 0 : -EIO;
> +}
> +
> +static int acpi_ffh_ffa_init(struct acpi_ffh_data *ffh_ctxt)
> +{
> +	struct arm_smccc_1_2_regs args = { }, res;
> +	u32 version;
> +	int ret = 0;
> +
> +	mutex_lock(&acpi_ffh_ffa_lock);

Use a guard() here given it will allow direct returns
in all the error paths. Seems like a nice easy code
flow simplification particularly as the good vs bad
paths will be more obvious.


> +	if (acpi_ffh_ffa_initialized)
> +		goto out;

With guard this becomes
		return 0;
and is obviously a good path.

> +
> +	if (!acpi_ffh_ffa_version_negotiated) {
Maybe combine this flag and acpi_ffh_ffa_initialized into
states in a state machine rather than separate bool.

Passing this one just becomes moving to the partly configured
state.

> +		args.a0 = FFA_VERSION;
> +		args.a1 = FFA_VERSION_1_2;

I'd do similar to have below and initialize the whole thing here.
That way no need to look back to see if the rest is correctly
zeroed.

> +		acpi_ffh_ffa_invoke(ffh_ctxt, &args, &res);
> +		version = res.a0;
> +		if ((s32)version == SMCCC_RET_NOT_SUPPORTED ||
> +		    FFA_MAJOR_VERSION(version) != 1 ||
> +		    version < FFA_VERSION_1_2) {
> +			ret = -EOPNOTSUPP;
> +			goto out;
> +		}
> +		acpi_ffh_ffa_version_negotiated = true;
> +	}
> +
> +	ret = acpi_ffh_ffa_features(ffh_ctxt, FFA_MSG_SEND_DIRECT_REQ2);
> +	if (ret)
> +		goto out;
> +
> +	ret = acpi_ffh_ffa_features(ffh_ctxt, FFA_MSG_SEND_DIRECT_RESP2);
> +	if (ret)
> +		goto out;
> +
> +	ret = acpi_ffh_ffa_features(ffh_ctxt, FFA_PARTITION_INFO_GET_REGS);
> +	if (ret)
> +		goto out;
> +
> +	args = (struct arm_smccc_1_2_regs) { .a0 = FFA_ID_GET };
> +	acpi_ffh_ffa_invoke(ffh_ctxt, &args, &res);
> +	if (res.a0 == FFA_ERROR) {
> +		ret = (s32)res.a2 == FFA_RET_NOT_SUPPORTED ?
> +		      -EOPNOTSUPP : -EIO;
> +		goto out;
> +	}
> +	if (res.a0 != FFA_SUCCESS) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	acpi_ffh_ffa_sender_id = (u16)res.a2;
> +	acpi_ffh_ffa_initialized = true;
> +out:
> +	mutex_unlock(&acpi_ffh_ffa_lock);
> +	return ret;
> +}

