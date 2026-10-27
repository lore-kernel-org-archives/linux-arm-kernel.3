Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D357A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4H9aOsfu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RPSRmFdf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvjtCN0W;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BkCeL5jZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=; b=4H9aOsfuFXqXLP
	TzO2e992SQzF7E09OEvKDytYLNM2eR8mBuUYce4cMDjBPIcfW8DSeMOIhfFLlVKyBo8+LGP8Y5aLQ
	TtY/8zJhQ76f0S80PQJbK2cFFEllnB768/cc3VkYw7+qJRKkzzJcVGo55r1dzKCVZj3guxMXfryP4
	8WjswEZZIG5Zt14LLwyIOzGJgmi+Y8pKLLRW3Lw9AvzcKD3UhBz2q9AGolP7SyS/RMWJVbDb5njN9
	Y/fo5U+zseYaibmtRS3ncvhFZJJer04uC/cMkF2mAZUbulKq0PrGwz+J/PJvivpEydGnQYrbQQ0bA
	5J4PznFIeNsp6kC80Xkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgSZ-00000004g5c-1OJN;
	Tue, 27 Oct 2026 12:39:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgSX-00000004g5I-1LNc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=; b=RPSRmFdfQ/dicELD2Gz8dTy2bU
	Y1rwQvTlYO/xZmBgkvsJgov9/u7Cl3hyv13TWExJcmJI417LKvN9waIG9CsVl6++2kS89ZIV7+5Fu
	2t6HgHyx7Yv13gZuyxb8oRQyvUgIRl8jPU4YpPwPBvTLdRd6bnUc3kNF6X8gaJqDsMXX/HUv0/gz6
	hTbhPZA95kS9D4BNrMQQGw9WQTakrUQiqtx0aoogwp25qIEHFRBqOu0vbtOtwA53qpiWoA+IFADV5
	iBI0I25i0Ubh7LZWtjzKnlmwNM7NpOvymFQCmBblnFK29AcClUl6Per0U7a9ML0RcnUDe+CDPTqo6
	0+s009cg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgSS-0000000Ewuc-25jR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:39:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeJkL1427419
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 12:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=; b=pvjtCN0Wqj2XrZ4e
	UIBV36XzWZKnwFhOsem/tlER2xVxXi+vo69aqus5wuFWUS3l/LEEoDJYO1TXnnbw
	tm1nPIJTrU8ZX6hIcggcXVOTRrDHfZcI/NEQPrv4s6O/hmxqhzo9ka0t2DAXPUcj
	aeb9Q5vSYIkUmFj2cYb4sIXzL1JDcFDXnxZX3cNDrI2/QLZpwPZtsc+H5PPYmqPC
	y3uybWlAQwuKFIKH05gI8z96UfDdrln6SHvcj7N+yI198I1GZnNPN+8F7GCWnl8C
	yZLrOWvyFJlCvBhlpylbO//huC6JJTfqw54eiwsbrObrESipRCHb2WAx5aqGuFr4
	dScenQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbkpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 12:39:10 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so3273965c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104750; x=1793709550; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
        b=BkCeL5jZxbPZqsiCwzs33DobmbcuDWc6f4/gPRM5mPGEbN1zR7TZDvuKyqYQXBnHpB
         0uH2LTSyZmKG7ljI+NVzFmrQ99U0DhB4T+zNWEvmMU6/nrdkRs9Fh7BzwRQir51hB1FA
         nzLxVmZCkVAOxeKLVw8S+cMxHOH/Gf9RzfZo6k9DbIoO/bmhIUOzmkymOPz4bCjC6QnJ
         HAixc5H6tXj4S+8G+L36XOsxlKvrx7u2Gv8Xi3ek7d0Q/Mah3o0TvNYWG0EhlunTGYkz
         TMv+CERt6URlSdVcRU5psL0oEcgs5chypWkt5RLe0ikX7K+1LymNhYWt+j5xv5aZK+Ss
         BjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104750; x=1793709550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
        b=C2fnLej2BfH61JcEXdJIG1OVhq2yJxPM9qpbNcANsU9RKkDbpd9KxONCgU3pFYueBO
         BzQVO99HzUreTVbgFmTtGi4wOd6Nt2LY9/gwfQLe4DNxjXNeVrgfyTtUDD35716SSgPR
         exB3SpgpYbRWUZ0ewqqko2vu+o81KOe08GC0iUSYxOnF2nlMYViPYMYtl6JxpgyFbJl8
         2RJ1JoDNm6wdOS1aBGL0x9BCNdJRuBXn7o+Onxt9YWiAgo5EexeCvVtfZiDrfnqgQwjx
         D7vMfB1uyk1KWaLuiSrBnkRcHcdMmEbWjxw6HTf5H95jOZ0MeTX9DqczdR9XGV3um0RJ
         3vDA==
X-Forwarded-Encrypted: i=1; AKwUvBxTF7E4b1KvM3fepdLv/NJ54CrPNOsBb/Pah9HFfpuLXFmiTtPrv7ELhU/SRqjNHuaUVcxIHNKidVuMWEOAqSvg@lists.infradead.org
X-Gm-Message-State: AFq9FYIXcNvJtZg13f9r9LnbJKhomN4pCMaQ4ehSIeqFeZ7W/9vvrjQg
	zM8/PB5443EEh5bDuZ3J7vHVxivjXY8xpFgn/Du/Ina/CHjbbpi67SbgPaTE5Y5HkzXN6oigHR7
	fWDJ8TYQVNIjNdDjXKNmPj46pcqAuvZy1WpDMXSQX6n/3FdP2pgoWwaxbUs+BhATdbjD6rUsITF
	DLamOWvyFllQ==
X-Gm-Gg: AYBFou2HhRs298nF6HjfrW/32ian4d+jmim4QzM8GhXZ9LlvNcu8nQVf8AYmI7O36Gx
	Fp1hitDUbHYxK8y+Nk+bKqMXJ3GSDVkZNLQwh/Rf4tD196h5waO5trqLbg+t9XSqZ1Mw5Saf8Jn
	5YtDmMI7oXdMb4AeCxyvzav/t6HKV/M+S1I7gprG3K+Vdn6NVKoxSJH5VvW+Pei93dQeRsDJdN9
	pDcCFokYLddjvta6VDAMYzKzL0B2aYOSs2UgSJ6JPu7rRUCfvTFNAFuUzM3QKIw+KPMo0rqt2yA
	n9+EkTDg43Bi4HdGgAgYIaeZ7aCAC0OMbF7vV1wsI7n46nUoLkfx5BFpCWWvyDGWuOMb5fJ/RKx
	fFTvZmi07WxLZZvhNMBCOaLPm/w==
X-Received: by 2002:a05:7022:29c:20b0:1a5:32b2:9053 with SMTP id a92af1059eb24-1a532b293a4mr1466958c88.37.1793104749639;
        Tue, 27 Oct 2026 05:39:09 -0700 (PDT)
X-Received: by 2002:a05:7022:29c:20b0:1a5:32b2:9053 with SMTP id a92af1059eb24-1a532b293a4mr1466931c88.37.1793104749144;
        Tue, 27 Oct 2026 05:39:09 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm32798498c88.16.2026.10.27.05.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:39:08 -0700 (PDT)
Message-ID: <3ad598f5-2e02-45ed-bc17-e4b6119ba2ec@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:09:01 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
 <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX7rRudIpquAR5
 rsE+3/CiuiqfHLtguh/fpMxyZ/rq5wJDBDhAADl5z1jztH2aaqPBsA11Iy5BycK4On6gJaT3FRD
 P+kIqm8gw/mcvkDozkNZ1xKlFBluv3A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfXxAu+ytHn8oEX
 hdCqGnYyjo96Dq8FdhfBfUOW8TZ3j0h7DZsfdCY2t7BnauYD9LF4RBCgr0SJs5VMpdIoDxKNJRa
 ndPqUYGpW3Rtws9dRRRkptpn2RkEol1jf3o1sdlKdGU1Kdqfe78m+N9G7zztK8jxNc5n1jlmCll
 m4SRm6uiphzMJExtu585Nb3uFHuPkmO924FhP1Jp4moycVWiH4prr7Ueii+dp8n0QjFHOkrDnmV
 e4+HX6JFl+65YSxL30hnIbN4UqxkHLDrC30rFunvyTNpwtt+XTG62Y/GQqeyvNf0CCKT0iuzf9n
 cw3T63hl1KGSk7XxfCt1DAtTy4So3XasvY2Zs9NtyTzanSVLWT9Rp4lZkn2nbtU8wA/EsaAIDL5
 lfk0kZMB5bpqzwHxHhE1XFMNWKm6jcD5BOI2/bjh7bnv9nOPvSWSyLazPDG/DueTYE0XY+BaIP7
 SgFFMUINuUha4d1C6TA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae09b6e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ddxl3Jw30jVTiRF8AwAA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: XFGbCQzbLC52GHKVCN9gcYfeNAhkGgFD
X-Proofpoint-GUID: XFGbCQzbLC52GHKVCN9gcYfeNAhkGgFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_123918_311429_EFEEDF18 
X-CRM114-Status: GOOD (  14.97  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 19-10-2026 16:40, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>> the latest wake up capable interrupts when the CPU cluster is entering the
>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>> implemented as .power_off() callback by registering MPM as parent power
>> domain to CPU cluster.
> 
> GPT suggests to register the notifier later, so that if
> mbox_request_channel() probedefers we get a clean unwinding.
> 
> It also suggests to skip pm_genpd_remove() in the non-legacy
> case, but the API tolerates nullptrs (although it does return
> -EINVAL, but we ignore the value)

I will move the genPD/cpu_pm registration after mbox_request_channel() to fix this.
As for pm_genpd_remove(), as you mentioned it is harmless since it will return -EINVAL
without disturbing anything else.

Thanks,
Sneh


