Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A13606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jukbCgFE;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cifd2DW9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kvu3Ir+j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uzDjr58ySN7ynEFuax05LT2YdSXHMlQCQifLPO++jM4=; b=jukbCgFEcxN2Uq
	+5D5slz0HbOrYPsDkMyJlHQSGnt3LD2UgxlywBuMCfq8fc1FtTBf1OV9DJqOnEYnIMxcEEhqWxsEL
	Vc6mfz2nPZ0DZK1+oXOyloAQ8b4UmxrXSEPRhOwlkM8Ljbtyw75nj8H7Z8Jjn6SLXiVosbJKXmuOc
	Zza+uBcL0zkMZnmN5FQYxDtyELlBmMAI7WZvVd50nF8hZFu4c1hAE8arRnLVIWLRUeaNjblNkKMHl
	XShA48GGnzsaAIlfVuZ0vU9b/wKyarwMh7rN4a8LM9J8xRgCfrODvMnqaPZQr/Ah8AY/nztLmOdOg
	Tv0ts7ODkHN53XyvOEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOE7J-00000002Rjw-1lLe;
	Tue, 03 Nov 2026 12:59:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOE7F-00000002RiR-3CML
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:59:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Cm7Ar3508811
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 12:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uzDjr58ySN7ynEFuax05LT2YdSXHMlQCQifLPO++jM4=; b=Cifd2DW9St/UFgNQ
	f7Ka0TUklCWbXbcaM6XCRFMpgwe3Xt24TUE9+UkUYZ3zKGkOlGaqPV0L+WmT6Bxb
	XgmE01LgcNVFO/N8a7avOTgT1Jp7Jd/4RzCiJTPvlpAidzrbCtulvVu3hRC4Cqhd
	lFmb88NawrH23WzW4Te3IEILGPlLu7r91449nJDJylO50yNeKpdfRXbBc7L3mLZ+
	Z21nM1Y7fNLHR7W2DWC1MGtCKIFUokZoNhLuQHrzJAj2A1GLR7B72Ih15EvOy5GZ
	+psPFHqxhV4HqX1KivXtqz3Zsq4A2yKrmFGr2EUSZ/URVY/IAoF83Rq+BZiUXMmi
	JWt2Sw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9aas1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 12:59:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e95f8543c9so39811605ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793710791; x=1794315591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzDjr58ySN7ynEFuax05LT2YdSXHMlQCQifLPO++jM4=;
        b=Kvu3Ir+joGhkvy6AWe0wbSooM9ujw8S2RdKxJRh+nUYaApevofsPG3n+txQUMxbjuY
         jvalDaBcHTnH0p6zJrdLBkO+OWP7UqjFCXBcV2zETz+7vw4eQ1cqN5oYRJ2aq2HBiOcf
         gmohuPcrBzEMIEeNc0hV+j5cACN+DWoIPTI1dscWQ+C+vsxga4C8x7+Tx7EAsZHkBcpW
         MRu6s6tcLfOUvaJkPuDZW1luA/1q8Qo76YpAorouzvcNyBdieYzyxOefNpkUcKUiF63v
         kRtM4ujVcAjgvf6cI62f8WWqos5IZty86/UM25qL2muHbkR57EqoQtFHTdDWu9j+BB//
         x4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710791; x=1794315591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzDjr58ySN7ynEFuax05LT2YdSXHMlQCQifLPO++jM4=;
        b=vJ/LcVhR3ZdDlUPlYDai5PsY6bDdkmpvee6BtbLjF6W7syQNmXs4nqmyprfpr/9RIs
         hM4TVQEHJyrdnDjD4kIGuTPm+jpdTBMf6TyWPblRQrk8EIW25YRLXIuZx0mG8lapS1wS
         Fy9c3yZHRCitXg4P3aRxN34T+Lwh3Gd6fpEHJ1L26uvdYbkAbelwM1V5q7xdSD1L+oAf
         xUc+Ses+WKRgfx8vuLisVr5/YKHtNQ06dZSa9Qw/rt0lsc5nbnkaxzUhxaNhbkxgSauD
         I/otnGtZ8KX2AT3BlCPKBd+jtErQd8rBcVXRHQvStaSYWzvGn1Uc8l/63nRfDsg1Efx7
         SQ7Q==
X-Forwarded-Encrypted: i=1; AKwUvBztBV8BvJoLIVOx8Osybn5KGws3RIDTtsRCtzepU590/+cl0RKpbKbAczDesc3fp5qTn2KoKb8ZuLteNmhekB4Y@lists.infradead.org
X-Gm-Message-State: APuU4Z8y06B1thL2YTHSjAtkIFZ9GFg2iFIMJo63nGh1OMP3o/BGpdqP
	WGBgnNcIUIwXh2GY0CwQ9VsSQY/JIYRIoF/CfgY5qwSU8ZeNfcUUA2gJxJKn4UwgTdSUjUSlwbN
	Li6sWZj1/MCBczpASg4tSQzpVBqRvKNfoUiHL/aBn945x4uxoWlR+cjajswRidqx/zXIABVStvr
	5jzQ==
X-Gm-Gg: AYBFou0Kv2Zd+PxXacQA6TimMrDTV2G76dfR7OFzOO6Xsc1qTIb1kp6WkKqctDYeGzX
	sD5A3n0cVCx1RB+gPvKQnh1jqa/Q8/QM9yLybKivCPZgCoMYDjNn9u++FoeYwIK9lV1MFH3MlNl
	/3j/vTrukMGFQEukcQhuvd2wObnrROazviHtKX1FUpWekzNpVanH2j6uGdlz4emWAQHOo0M0gVu
	007jrEuiegf8XaabkF3offf9OhXdjlrPrF7mTp7vA+uIfNK/CgZIbJR+eFGJqR3sOSgxZuVgZOg
	7zuW/cmyuG1s05rl+n3bDvILOeVoz0UKle8v5WaR2PS9hcwWM/OY/c8Cnqv7+CNYeZUFGmubGik
	WrBZgAHiU/89//xk+cyjNT9yQCPi3+qBEEmsKvQYu94pWbIuNqF5fdtih8klYkPDFLVmaYSX+Jx
	oqJ1erripLbuEUSXYQpNGy/qljLdojum2Qs5CksQmTBwv7/7nXfifhijcJx+4ZgA==
X-Received: by 2002:a17:903:13d0:b0:2e9:9b5b:e179 with SMTP id d9443c01a7336-2eb36504ec5mr131117535ad.50.1793710790634;
        Tue, 03 Nov 2026 04:59:50 -0800 (PST)
X-Received: by 2002:a17:903:13d0:b0:2e9:9b5b:e179 with SMTP id d9443c01a7336-2eb36504ec5mr131117335ad.50.1793710790114;
        Tue, 03 Nov 2026 04:59:50 -0800 (PST)
Received: from [10.50.44.6] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928f933sm40414795ad.58.2026.11.03.04.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:59:49 -0800 (PST)
Message-ID: <72d9d2db-5cee-457f-ab03-0d166a84a49c@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 18:29:45 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: avoid hour-long timeout on invalid ACPI table
 entry
To: Andre Przywara <andre.przywara@arm.com>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261102112748.3458012-1-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261102112748.3458012-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bRrKokTYITLwQYnQgCIT_i19XBkdBm3v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MSBTYWx0ZWRfXzwP+0E+g/bc1
 rv1SMuFxh7LNIadhThj49ZeiG6Mn4v5VQI+SNC8tNf3gwk7eyTytrqbW4CjvH050o4B7PoCIHF4
 mg7UU7I7+2ZfYFEbZmfMv+zkGXgaQzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MSBTYWx0ZWRfXy23BrAx9XUY5
 eSgzwuCfLdGOaI8FKYfLKLN2wIC8YVtq2dA4V7dGF1r6mMA8bFu7BLawrk4kC8upoJjqCReG5sS
 ao/BVO5BnfzumEcnSIiIU1qeuJvraDE7SsjbZ2Auw8GkhVqlSkRDouUV0QmjSarFQpM3sGmiB4O
 Q0izOhU0V1TLUNgikH2uafBzAA6uhuB0iEP5PpG/hpouGiRCOmD5sbxQN313PoD8xAqys2Yvehd
 ySBE+vwhacNGr8BHRJDllv13bc3gGTleHatby9MRHD+5kSSm8496H7YpdJ4vwnbrme8QO0Eo0Cn
 54uy9B9FYoaGhq/aLU7JZimi2T5HGAyRxGJg/QwCrNTzPtwOxi0VPGPuDFE1QseV4ansdjnMa9k
 x9ZOQXxeWnjMl/99qfbr30FepocoGGLc93vb8QwZed9BBc2+eXYdhgf+bmOsuzVD3yPtiZXFJiR
 QaBnztLXEHmzOGQNExA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9dac7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=xQjQ7c2AriHHlxExpPEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: bRrKokTYITLwQYnQgCIT_i19XBkdBm3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_045953_941550_3C7336B5 
X-CRM114-Status: GOOD (  23.92  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

On 11/2/2026 4:57 PM, Andre Przywara wrote:
> The ACPI PCCT table contains a "nominal latency" field for the expected
> maximum time it takes to handle a command in the PCC mailbox.
> The generic ACPI code reads this value, but leaves the handling to the
> protocol users.
> 
> For MPAM-Fb based MSC signalling, we use a value derived from that number
> as the mailbox timeout. However if the ACPI table leaves this entry at 0,
> the mailbox timeout code interprets this as "forever", and waits for one
> hour.
> 
> Avoid that lengthy timeout and just add one microsecond to the read value,
> to come up with a non-zero result in any case.
> 
> Found by Sashiko.
> 
> Fixes: cb351e3f304b ("arm_mpam: detect and enable MPAM-Fb PCC support")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index c067b6d57d71e..fb596ed19a648 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -102,9 +102,9 @@ static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
>   	/*
>   	 * Timeout based on the "nominal latency" in us, from the
>   	 * PCC ACPI table. tx_tout is in ms.
> -	 * Add some margin here to be on the safe side.
> +	 * Add some margin here to be on the safe side, and avoid using 0.
>   	 */
> -	cur->pcc_cl.tx_tout = DIV_ROUND_UP(cur->pcc_chan->latency * 5, 1000);
> +	cur->pcc_cl.tx_tout = DIV_ROUND_UP((cur->pcc_chan->latency + 1) * 5, 1000);

Would an explicit floor, e.g max(DIV_ROUND_UP(latency * 5, 1000), 
MPAM_PCC_MIN_TIMEOUT_MS), with a comment, be better than "+ 1"? It also 
avoids the side effect on non-zero. Just a suggestion.>
>   	mutex_init(&cur->pcc_chan_lock);
>   
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

Best Regards,
Srivathsa

