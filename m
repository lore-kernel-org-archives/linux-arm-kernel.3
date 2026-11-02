Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FBD606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TnfgVuBp;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiFHV0BW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cUD09jMw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=; b=TnfgVuBp8CyIOa
	BvlrK5ieDmiXiYc9KgiX2jnYYWQGwEt+Qt5Ui3asYfEeFKtXivFD4sCAubcmckcD/S//kfrg99T1W
	EOCh9iOP3hbWzVqYbvz5zzcUCuDabUk0hMNBxq5Mes09tW6FcYVlMIcu6bVzDzjQG3oVpR+uP+ajv
	2L5hqXeFF/W8jG2PF7hY3mCVcvgMYopln/eFN5I88Qzo0ng3hYhijGFSpFaaOp9NbEkKJtkN2XXAz
	hdccW9FdNIuNV/i+I/sJUezgtx+zp1QQr1eR9dBK1WlObuF6bFYfn/qSArLBSj7/3VnYigxraLNm3
	+se+JvjQ/QGVkvxOjbFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNocq-0000000G3hE-10Uv;
	Mon, 02 Nov 2026 09:46:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNocn-0000000G3gq-1mvR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:46:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ATGH2361264
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=; b=XiFHV0BWymHOnOSJ
	L5CIiFfEbbxeMZBbp+OurSVw3H4tFAEof8W0HtHYt1nN5zxF34dTDqLRM7aMFmOV
	659auF767JgzjXGYfmiXAwi7lN3VtajsSGb2ImUWD5MBsdZCZaODoaGEjevdw/LP
	BGWG7J+ce3rNewtPacFuxeiM64M7UZRgo5qMKgOCFqCf1/DDJzxrGR6e4oHGZD7g
	7sIMJLyUMJe0n5zHxMLhRdrY+rI+/Y14Sy00686LO6KFWTy0n4s6ckiweooPWR+k
	vFyNt4dALNRT/wg2HxZymuCklN9DJaGdKoL8bVPM/ND4P4P8THW1/OLFiiKLaDfB
	uviAHg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7x7s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:46:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c99c10e33so7636586d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612803; x=1794217603; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=;
        b=cUD09jMwPhcuhbFr/YcBmG4Oe2jZBO92KPUXgOXGq6if0pzizRchtjlBewuSTX2bYe
         uq8Xdld/fV2t9l7uH4VAVnkF8B8NiR1vLfKISpAiIVf6uw0FGm89TIb+zkpzJ/8Q/eqM
         tY1K9sOXuOM5L64QITomAxPKtiOimTM4W98LZ/Z5vHBjRtMlj5wQ23DsQI7taKni95Ms
         kC0KeI3ECn3vbm0uc7mVFPpbxUTkhxNrlSUwEjR6SkaseKPSkQTUkLNXBoruIehsLGay
         YSJdGhdaYTrkozDW3JMGz72GFfw/0EXNGOlt6WdV73e4wG0ZLhfPZPkEZNzsJkLaqaE7
         NISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612803; x=1794217603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=;
        b=nneIJYvQcRov4uZxyjI9rttPVCa1/2XSSC1TW8Wh1DwPH4v7UEfGVIm2AOvTLmPoMN
         JLWeetu28Bg4Gw6fEpy6VQAgCIJMeuoOClf+aqjRQBJvOvJiGhXZw2tGxrPhHoSVtiKF
         yNitpnkCIykxHX3ROruUE85uc6DQ98K48VrwyhajEjxubs1Ot++KhKFnKTjPlr7QnYlp
         pRLm+VZkkDzgutFwLgCUKDzOqV5o2D5EWj3cxVEEBAt/jQiIYBZQAwaHQtwU/DLkrcbB
         vcx2fcJPT/WRvMnJBE6ijTxYwaHTR49AVNZmet9PYpqzeJk0Lf1YVdZFW5EJ4LDPVEUv
         1pIg==
X-Forwarded-Encrypted: i=1; AKwUvBxcoTnII23OsOzBz3/ZoZGV6H6GMFftJucKDMCRQKWQJi8eFn5079laKNTrWPEaNzXn3WmW52/fl//qJsle7nCP@lists.infradead.org
X-Gm-Message-State: AFq9FYLF4t5SPbcj7CPUgqys4EuEMArdD+f5ML0TsjL06+8NQ1JzBRl/
	NBlb0zuk1pqY4ykzf8JYPJOT/axcQJwauTBIliCil2lfgM/x74P45+/pmS8JGIjVYw2/das48td
	E88GABEeVlHRU/dZviPbjHW1pAkypxmDUNMZubDWDKOXwqB4GpWJrg7pdJwRkRsIcSDgotIA9x5
	8JaQ==
X-Gm-Gg: AYBFou05tYWR8CKGMntHmyRwb6+0oSkcj4iErXt50LkQ3EZph1d8QPmzOOsOjr4ph7E
	T6KBrAQxvgDSeHpk7KbysS704Hb/4/K7ZRymLrauf9nb24y2keuoobWa5DjOf3SnuhBDKdA4mng
	FAsVKVSQMsmgfkip7gk78Yk2M2v//aBGgCccZWjjyuUZ5H841TtXSh1QP1boTNQC+QZ0yupbItG
	QDI3XULpcGB98hB7qiq62LDKNhGJce92pUANJnX+xZjnv+e6riZBMneKsSQNSZSUFc50LK2cOkq
	Hx2dTwLnpVxyY1bNNJJCLw34bkORbblpJ0ODM7xQpPoTw/krB9Jn/s1/3IvvEGwfKPbC+AVCn5M
	E5Ihv1BW0JnPqV8o3h+DBkftRdFAe8xOfdtoGZMJ1yTiTfANfecPRuuSeEh6SBA9W9duykVo=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707618085a.0.1793612802982;
        Mon, 02 Nov 2026 01:46:42 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707613985a.0.1793612802474;
        Mon, 02 Nov 2026 01:46:42 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm362069166b.64.2026.11.02.01.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:46:41 -0800 (PST)
Message-ID: <798f1e79-1771-49b8-9d4d-705b013255e4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:46:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iommu/qcom: Use identity default domains for the MSM
 GPU and display
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KSnJnXyx_wuj1TdpKMyenesrK42zCpZY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX7i/6nO2XVVL5
 vDfzCKlZoz3tAyt0jpDafB1LFoF6ghnRota29xA1fEpk1bcS7g6fl8IXLLIzL541+g+n04ZFq22
 DicJb4i5tvKzAoCgWZkpfLtfLXtgPY0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX7MTS6iQqP+h1
 FDqDv1eaLF+YgDYb24Gyzm2shS7tAZQTgtT55xkIYRjspB8LzLshZVBI1TlkAGFM3nMuPUAhMbv
 JOuA2Gqwyb86FWRdIDeRM5eY62YIh9F0tJQwUZRXjQHgvWko4E1xTiwTqtfRxt3gRLLJQQm3suZ
 GveXDbrMgHDnWmPPny0YkG73Reoo6qmsJpwSZd67zGtuCTMWgt3xjc3rujl/2xLFbSIlERFYfSZ
 ZQAE5YuaBxQXP45drC6ld1nS8W4ogUVULVqMPHdhhk5ukbazRkx2IVSKcbSiANJiiK2ZEA2I7rD
 uIX0YfRSXF8qJ5PTGseMcnrCaV0WBGVsiLXYvCAhqSLsbarvt4ADRAQpH8VGPfjyZmIgekcfywd
 7Mxh6sZs3Zd3GWqw7sXLfk0zDkhyKg90p5nlaHJIDG0sT1167vL8BFqOTJhPlkz5/9ja3Y97YwF
 mBW+XN54DuIaqIk6IeA==
X-Proofpoint-GUID: KSnJnXyx_wuj1TdpKMyenesrK42zCpZY
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae85c03 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=d7qithtI8vA-lzetqicA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014645_584852_4F43B8D8 
X-CRM114-Status: GOOD (  13.38  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 11:04 PM, Dmitry Baryshkov wrote:
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. qcom_iommu has no
> def_domain_type, so the MDP5 and Adreno devices do get iommu-dma, the
> buffers end up mapped at IOVAs of the unused default domain and the
> db410c GPU fails to start.
> 
> Use identity default domains for these devices, as arm-smmu-qcom does.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

