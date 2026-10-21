Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F14606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4xmaR1NU;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwgbev1Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6j/D7BT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCSVqnmCg2tgiS2qJzUGfrVmwaXnekD3uvjwV9akWpI=; b=4xmaR1NUeV0kvavkYF9lpJQtLU
	2eKRIECazfGijRvFDRpxmt+yLNTsmM4gq1bX++jGTXgsQ7OoGT8ef0CtuL2AuLJ7IHoeBerDBGEzE
	Yfj1acjhzvDoCgjZEuuU+zDkoj4JvHbnuAD7ePPK2ywTA7kQJvMM54CQJfHWSP9scvSyxJP8cR4J4
	Nr2GtUXgbQauWePr+MuUMiYyiaYHqHaLtUUjqZpaWFcAB93wnOgXEOEG6HfZPmBfRR0fe8eku2tld
	7Ceg7i5ethz+EAeW09RkNlzXqF2Zo6FqceOxOHRndv+HMuMokL+C3WagrvUuILhuiVAm5pFJejaj1
	ScdPX7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYjy-0000000CKOM-0h7r;
	Wed, 21 Oct 2026 16:00:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYjv-0000000CKN9-20Gj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 16:00:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU0uP824396
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCSVqnmCg2tgiS2qJzUGfrVmwaXnekD3uvjwV9akWpI=; b=fwgbev1Y755yo0Wk
	UtrQff0d+SDedqVBkyUwA25GdbsQr1gedtRARzdBI/EmAOe0XsQToYsDxG3dcNo7
	WzxSgYac/ZGOsmY8agUmPRwldZjLtqwf49ThqvX1StCK7jmI7HXPKz+sOHF/9RsX
	d2pytN0NJDGCo1MhMPxlfFPfca6UKvw74dPxLEl0uCzKdYPb+HZyLX3GECv4+38B
	1RGJ0zWdQGHzDf3e0b63brnwjxFoTAwfwuugTBfdk1u7TM1ZeuovSwyIH11w2+ZW
	SdnPxbpBiqOcHpBXKX9x9UDSHSBDxYFiyv72OFxlygXqyI/101YubsytU9S9Gndm
	8d/hEg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4ujg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:00:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36803927a49so1320483eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792598427; x=1793203227; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZCSVqnmCg2tgiS2qJzUGfrVmwaXnekD3uvjwV9akWpI=;
        b=Z6j/D7BTEywM0gbXqyOcL1SW3ztE3dy1IXfAg4Z3ap531WSFqinjFH+LY4rnsPj/Eq
         FIubBxy1GmdkUO0+Z5OI4nqpdp97J9oR/VITlSqyzACAzvdPGl4jEP0UqCP2PqychcdF
         k3kwhZd2Yzv6m0mWbIBPLuMYqe94FBpX2rBs+Y8ltdEASJ2yLtAuynGGg4Y/o9ZOxC9b
         pvzpjCpX4MsV8EiY68T2USlkviyEJ7RyVvG/qZt53MhxhAWyWFk9YME7g2esRr8qLL2t
         iRc+LRpPTIunPpjKtEROlXCZfxG9wqxh/KCgDjMXy64P7cuYwFh+uCCw5TWGqoe9iUOa
         nzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598427; x=1793203227;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCSVqnmCg2tgiS2qJzUGfrVmwaXnekD3uvjwV9akWpI=;
        b=pYZ9WAh6DvzCOlE5MdWbiRf7iCrh9I5WqT14Nqhi5VXUoz8d9kdgR8OZzP/jM6kg92
         bW04R73eehGfoa+IxPW7sQ7TTqli6p3WsB8J8BkBZnwc+fB+E7MXBB4hPhZYhlofm+9p
         l+Qsm35LLCqBIZgWIND/Yfu9grZOFof1bJQbXJGeJ9ElX5DbYk5CdJ2NDeeJsWQQt0sx
         FB/JQaSdFyL/YAxo0JLTK+ErjcTewPi5TpJrx61hcj73Tva++WHiT5NZzB3UK/zgCN97
         IY6M2r9IXvPyPL+UoHSi90vYlTXo9D2YNY3wzZMt1NF0CdHHugAEByGiBVGu8j10Wwsj
         SHhA==
X-Forwarded-Encrypted: i=1; AKwUvBz3pRDbJ9LZfNjgX2Szow5qQNUQFFo14OQj2meEGSZTzpw3VoR/K45Amuy8+cFoHMrlKhm77LNeIPV2sEvtTSiy@lists.infradead.org
X-Gm-Message-State: AFq9FYIViesAn/Dc93R49c0cHQvYRBcVg8VlMNvRjjXCV53rY/7/+K40
	hyw8faaxuzlJ7LWANUgyfPOVp9gB5VDTXluhi12zkqQNRpnpwbSv2EGDGJqiMdYtsVdjEoSjukf
	A1Vhr5VgzcKZuTPsaL+fhvEdgUxTptY2tmpb9XdYG6SMDon73bOkg+czFbQQnXuWBo8dzPt7FDc
	RUwQ==
X-Gm-Gg: AYBFou0LFD/L1bFeS/zKO4TeFC1PdnlwrugLzBc9StMH30Ebxe7Ax6oyxtG/ef+WOpg
	WW35dAfG13BWa8Qc/TdPnDDhCtVqOUfG/e7nqCNCw/xPviThNKcooH3mvSSBqNuipNrx0DIgUKB
	PtWhvLxNMnJHj4A0EseIkDJckUdr30fvlpWUccPJnXiFqJ1Dglvl9/hWKa7HpJxwCKAsPJ0Bws3
	c5viWXap+EvYRFw83Xg77n2aU9hQTMU2gTbyWxbS2IMlTXCKZiXIQiJB3zQTQqIYitgBE77sIJX
	Lx2gQPBVxZroavfbX2NFkf+wtpjd55ZqSWn3YQ4BK+TQfzhfOvBvyPAffg1Tfru88tzPHiwRPQt
	ZiHiNPnvhjXk2RnCY1j4mLiqojalPXpLFz+xmBYTpPw==
X-Received: by 2002:a05:7300:106:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-3674ef292b9mr4299671eec.21.1792598427206;
        Wed, 21 Oct 2026 09:00:27 -0700 (PDT)
X-Received: by 2002:a05:7300:106:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-3674ef292b9mr4299533eec.21.1792598425455;
        Wed, 21 Oct 2026 09:00:25 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm10188327eec.5.2026.10.21.09.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:00:24 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:00:19 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev,
        Piotr
 =?ISO-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>,
        Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH v2 02/15] efi/riscv: libstub: Don't set image_size in
 handle_kernel_image()
Message-ID: <20261021090019.000060c4@oss.qualcomm.com>
In-Reply-To: <2-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<2-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfXzPNNty7jqW+O
 Myv070pTMvHjZRQs7n1vVPcZMUxyuGQkyzRyxYYC3cgTatSdcFv7pOLjk/zgm2w5IQ6nkLnVOd8
 ET+huEQmL5HrN5RkinnBaQmpkLICC6M=
X-Proofpoint-ORIG-GUID: A3pnCtiCtZ784YnTwL3z4Yh0PJFZ5xII
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfXxztbf4Vlwn/X
 fOMHSEJuFDkRWl05yS1KNAhvpqZF457R7VVDjZwH0HWxze1+PGy27DvFE98HBUY532wcAk+AoMH
 1o8811cWnOJYU1XkGX1P4N3mr2wyJFy63fWL6vUoZzev5/OzRb3mwa1IBtbbB0IEejHRC6OdER7
 teuSJejRyJpz7FtrPATLSIGef3dkQ/z+7VNwJFYgC+gjz44YEpsjK4Ae1GAR+tbF6wfVrZSV1F1
 l0pSSs9F8Gbags05v2/Vvk4ZH07iyM9os9eFS26XJBZ8OEIRLngbb42vWsOvMCYxbiHuKwz+AQy
 Rxah7MmT4EIKoKiyTuL99atcugAMU5gX/rA1XJ4FCe/X9/jLGaXW9y0UFp7R1qWsV742tECF/dU
 V1SUMz7M29L2ILUQnXej+yiEpSq5Oap5MmEjqDF4kfFM1ydkvUO1m0n1yuPpMouJsuMyY8e8RyM
 Nfd2xhCdy2lPsdK5LSA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8e19d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ikd4Dj_1AAAA:8 a=xbFV6RGmdEKkzbgyJ_QA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: A3pnCtiCtZ784YnTwL3z4Yh0PJFZ5xII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_090031_625803_E9A660C0 
X-CRM114-Status: GOOD (  24.39  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri,  2 Oct 2026 20:31:39 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Sashiko points out the image_size should only be set if image_addr was
> reassigned to some allocated memory. If image_size is not zero then the
> caller will free the image_addr pointer.
> 
> efi_kaslr_relocate_kernel() never works like that, if it changes
> image_addr to allocated memory the free is done through reserve_size.
> 
> Fixes: b7ac4b8ee73d ("riscv: libstub: Implement KASLR by using generic functions")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Hi Jason,

This made me curious on the differences across architectures...
Looks like there is perhaps some room to make them look more similar at least!
One small step below.

> ---
>  drivers/firmware/efi/libstub/riscv-stub.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index e7d9204baee312..725b634c517919 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -37,17 +37,14 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>  	kernel_codesize = __init_text_end - _start;
>  	kernel_memsize = kernel_size + (_end - _edata);
>  	*image_addr = (unsigned long)_start;
> -	*image_size = kernel_memsize;
> -	*reserve_size = *image_size;
> +	*reserve_size = kernel_memsize;
>  
>  	status = efi_kaslr_relocate_kernel(image_addr,
>  					   reserve_addr, reserve_size,
>  					   kernel_size, kernel_codesize, kernel_memsize,
>  					   efi_kaslr_get_phys_seed(image_handle));
> -	if (status != EFI_SUCCESS) {
> +	if (status != EFI_SUCCESS)
>  		efi_err("Failed to relocate kernel\n");

This print is replicated at the caller, so can drop this as well I think.

> -		*image_size = 0;
> -	}
>  
>  	return status;
>  }


