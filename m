Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B54C53200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPCrpQ0VJGnkL8TeDiCE7B+2L9MbbS21BzEsGKWPP/I=; b=0N9eUDMzmboZhQtYxh8d5W8ejD
	ttvqTXMUbEJXEtz7+SoDVeiVQWdPiTkA+M5yqomtsK+lHYshSYJJ1pFgsbDbAmlXYR2NswdMxS+s1
	TNkaZl0RPIlPlW3YKmcfzxUmGBl2Y5HLyLKSkZ8Lfw7uWTuWX9U+fxrc/a+VhFqYu55Qa966fbgC+
	iNwvnWcDYukSR7hjkZKMrH9JugS2wAZdsgtfeM3yBdfsybrkGClR1oIpPL72HdNsaz4NYuamia+b3
	6D8cEaRMCQ4poAB390ZT/9+txMdtXQ9x+Wk+sqZFkAVd1SPU8K0D4ZM+kN1GIY+UjtvMMitY+vNCh
	bjNbkKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHn4-0000000Ghfc-2qTo;
	Fri, 24 Jul 2026 15:26:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmT-0000000GhT4-1NAa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Jul 2026 15:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KPCrpQ0VJGnkL8TeDiCE7B+2L9MbbS21BzEsGKWPP/I=; b=i0KlH3H8cfibIfAc9zn0phUhfG
	DTsur55nDnEZZoIbEdetXk4ghBlSsDiuXf0LSMkR4/JbMiu2UIbsCj/nLIqDYOxD7MMUXnnxgLrSV
	sEvuw6THnBJDg4LyIRogP2NbieSGtFCuMUQNkg9AV9inX41hDgEknykWUW7XrQfcU1tCr4R7qslnn
	xyr6BqNcoJIYss4g068870HJDVEHPq0+vFNEkHA7g0bHsXbsLsrNtR9QzaEoYttelg1o3rwPQsAI8
	2r3uPqRh5KHs0AKPBYz5RxF8mYbwga80Qo7HHD7H16/KO0rY5gvehvSDlhK7NTgLo0GIT3r+S0MOG
	P8z+xw+w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnHmP-00000002hoq-20Sw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:25:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbAZr2933471
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPCrpQ0VJGnkL8TeDiCE7B+2L9MbbS21BzEsGKWPP/I=; b=MAa0q0GAaRVPzYQf
	YGCgntqUuQsm3Txj5s0FjQeqY356BJS/s2mwbtwwlkNDO9UmVSeYArhsvi445ztB
	3FpAFO5jz66XNmL2q1h1ldc+7pIEl/yGOuYCWsSqU33JfuQxmnG2P1lUWEY6aPoL
	M1DXl7dkQ8rxsjIu2pzMZkhubPLUYVRIMzZdlvE23Ivkaj+szb+gQl0xxTT+SZL1
	t7xTYFhisO7RfSY4pMV1DCnc5zf3h8URctquQbwTC4+EHaYt2T6FMLCtKocQk0HM
	d5KvcoBKaTkR6FRYvfat7L9lM5WoVJ6sQpgW+AqUY6ZII1rjFaJGQxA+eyuJZflp
	SK/plA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj8jra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:25:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e66f9e2baso78895785a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784906736; cv=none;
        d=google.com; s=arc-20260327;
        b=Qe/xio8fbMYwkv8eB78V9ZNMQ+XlLBKpFkkHKb7QxC+o5DkmTRAqCh7hPohhwCnWht
         5Jrlp+2p+WqYLtG3l/RStFcKpiw+W71XHwaq8gv/0Snq+hQULSXkWfvtYGt6D3QWmEB6
         LXU4mf3X0XD6BODk95SAtSP2h0nT02R1hOQSWF7ZY7DFhVmous2RVhvoaW/urugsM4XY
         BlBraXTaZKEyYjapruc1bG6rk0rxOEOkPH1ysgrMiSNmv6fSpqdWjKnXhi2c+Yfjg52U
         eQHSnVul6cbKuhgXKBxd2ez50S+mXptwJ4AtsZ9xATgqiFw2tgoMC/Wf9+5c4uCxDtMT
         cBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KPCrpQ0VJGnkL8TeDiCE7B+2L9MbbS21BzEsGKWPP/I=;
        fh=Q9ieofumPRUzqERl7dN8FtmYJGHz80splHsgg+wXP5o=;
        b=Wy2KzYK64oolu5+CFxu4wJh641bSzQACi4Xdn8Lr8Cws0nqsatz1ynEJciN19D+oYu
         QIbjtg5+oSEHPwmr1v2XHxbLL/3x3GRjfD2gLlvP8cFnz0IDlLkl93JotuCS+LkT5q5S
         OC2ybfh6Z9OL24RLXz1m9mNVUjTPFgDpzB6wEvSSE/ORPx7bwkTw/Cy4Ju4h2DOwAX4w
         vqTosEy9QmWSsbJg0rWjtmJ7uiKYsBwadZu7kiyk+y0wmd9eItfHbrz6xcFKuSTNkiBn
         cH+d5J6smrVVpnDUX2wrFKm3pQev5MCfPxs4aK+L6KME0JlUVUGkOgC5N1edvbtJRwVP
         uxFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784906736; x=1785511536; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KPCrpQ0VJGnkL8TeDiCE7B+2L9MbbS21BzEsGKWPP/I=;
        b=EJcFEWyRcTNDo2tojeN9M4s5XlKdRsTZWUqMZU6s1/PjWIZRp8fJfs4wXkT+EOI642
         YAq55HlM0BkLzm1Gwz5oCg1Xy5YdxIyclr5pnQ/5fQ8bW7ebiyf/NqYnrok1j80JwJNy
         d8c798pXYSS/2dYS0uY4dVdvyoFFXt3eRqqrMi5jeLyX99/++rxFvScT2R5PygfvWti3
         hPlaKzsuZnyqxVB4tWPU876OYACS7RlCF1Nb8CAPaIr5EiqGyTh8gpug73YQZzQjV5D3
         v5JjlvmUpC7goXdzAMdw+IOYRc0jEXJv1QfrWWpAtIWj7C/k/BRMCN8VkDFcaUeIbiZn
         HLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906736; x=1785511536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KPCrpQ0VJGnkL8TeDiCE7B+2L9MbbS21BzEsGKWPP/I=;
        b=pNVB3vBql8GODq+gRrqWt8SPN5Ttd+FfNbjSibFL4a3tLN2SAca0Q8DE2tQWGDeIz3
         Te4XRH+RamGFdlJHUyKuz00D3PoZ6hQK67njFsfawF2rDX14yekt7mteMiyg95XqIzmt
         GjRmwFOJIXzPChCreTiUp1cp/2t+Ctsz5XXJ8v01If9/ZSTxPGMUO0dKAbp3LKz3aUi/
         3NrYGo+rrmGRNEqS1fimP8UH9gThEXL3YBu1jv/6bV/UgLkA4a3eCe+DznN/+SIl0LPM
         NPF+8Dy5ahlPdcPz9JIAvf7nqtDqvGfKMfRis3UrQeteRzPIgmqasXPCWpU85Z3twp60
         SgSg==
X-Forwarded-Encrypted: i=1; AHgh+RqNQU3m3f56Pf5Uk1u9HWihShY1XVMB5zuJS87ECIe2zksAkNpZXyPnNYyK3Xbm6gYDPPmG64n4CBzn22yZ0C77@lists.infradead.org
X-Gm-Message-State: AOJu0YyHdb62MRNS3xLXD4hxeyvEXKLjWDKG6FaL8rhxSsjXHZDCOMWW
	6MpcTjSoihcwTvRaDtZtbWAI9scevnG7TBoDkDqA378TUbjIK/aeQQ3uwTvwo1uYDSz3PSwCQD9
	bXEvO95R5/Pnvat5wtq4YB5F47DABIVkahscrqnAi1KZC/4oBC/o8AU5+6YTXNp4rlw2tfNIotL
	waQQ5Z/NkfaWZvUw4mpgU5d7pgSuntVtBef5eKDXx+17Onr0E/gPN8
X-Gm-Gg: AR+sD10oZA8QM0IxCjol6XyRjbtk6MpvA1zrsKdLM4Dar+irmfqEuyQYI3SkgzJaCRu
	Zw9YT4MSi25bWzWciOXC7Q4emJ86w80Ga51MG+yzjepiaeDNnJ/1NJ4mmSmcYel+/RbTKCPPmVv
	VTNH4tlbVTDa6I09PwCXu3CUc5qruHTJ/P4oj6O7/7jreos9eCUlXccApt2Q==
X-Received: by 2002:a05:620a:3909:b0:930:ea41:771e with SMTP id af79cd13be357-93103852b6fmr821823585a.31.1784906735828;
        Fri, 24 Jul 2026 08:25:35 -0700 (PDT)
X-Received: by 2002:a05:620a:3909:b0:930:ea41:771e with SMTP id
 af79cd13be357-93103852b6fmr821818185a.31.1784906735245; Fri, 24 Jul 2026
 08:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260708234614.499613-1-midgy971@gmail.com>
In-Reply-To: <20260708234614.499613-1-midgy971@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:25:23 +0200
X-Gm-Features: AUfX_mwrYV4f6v5r_1WLYjP_DJ5j8CdxwNSs9NXFS9k9uGsEaGAAKztNtVNILsQ
Message-ID: <CAPx+jO8vL4Ne14r+bR3De7riiNVRJK8Djm=b+jTsOscUynHwAA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: rockchip: Add a regulator to the RK3568 NPU
 power domain
To: MidG971 <midgy971@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Finley Xiao <finley.xiao@rock-chips.com>, linux-pm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a6383f0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=s8YR1HE3AAAA:8
 a=ghsCoqtGgTSC4U4bjT4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfXzTOHQHVpyOlG
 rLKt5sCthAUBshm1l2RlsVYATD/je6kp6Ovl73KqIukceVJLe0Iy+gCG1OoKzMbIImK2c2Tyso2
 3T/W3ANr0CjfI+8PhLVTMbIXkJknpUaPVC7hCySpQ9OjIj3nuzqsGZu1+v0QqenBaGLg55XhaCg
 sRpkIca6TRrVoPlt1Bl+gUKuROIb4cQj7g+icYif2RXoJY3EstBL8T+sEb1Jujk9pvAgJARcVdX
 oXlQ8LcLW9QSv8j40WB+fAKNPyDlaxrZrKKjhiJd40RN5b0jtMblclRl90VZ2nGpf7LZz8l1iF9
 CIYvOYfj2EKbh2BlJ54UGSUw20QhZQqH6V3WK4+XjbkXWAZX3o5E2uUGw1ZYB0s8QCHSs780GqT
 120hMIXyuAvDVEBuuB758+IlQlhvHLUvgM6Zvw3ForzNHPM0GL639DeGZ3QhRGxkUNeWMwM3TAn
 TFgdVndSOsDSXnR5LAQ==
X-Proofpoint-ORIG-GUID: gpGZ9IQ7expICMawu5yZGA0eyTxpBFQ7
X-Proofpoint-GUID: gpGZ9IQ7expICMawu5yZGA0eyTxpBFQ7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfXz9OtuHujVDs3
 59pTiSmfl+NREg90YeDRK9jzigA1zDsPoZR/UpoCRMyzas+CsLzpQ7v7qif4qe7DHrq7QygIRi5
 f+7lzqkid0RNf7G7BLFVM5VGPOXpR2o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_162541_953061_E1093409 
X-CRM114-Status: GOOD (  26.11  )
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

On Thu, Jul 9, 2026 at 1:43=E2=80=AFAM MidG971 <midgy971@gmail.com> wrote:
>
> From: Midgy BALON <midgy971@gmail.com>
>
> The RK3568 NPU rail (vdd_npu) needs to be enabled before the domain is
> powered on and disabled after it is powered off. Give DOMAIN_RK3568 a
> regulator parameter (like DOMAIN_RK3588 already has) so the NPU domain
> can set need_regulator, letting genpd manage the rail wired up as the
> domain's domain-supply instead of marking it always-on in DT.
>
> Suggested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Midgy BALON <midgy971@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> This patch was part of the RFC NPU series [1]; Ulf Hansson and Heiko
> St=C3=BCbner reviewed it there and confirmed it can be applied independen=
tly of
> the rest of the (still-RFC) rocket driver and DT patches, so it is repost=
ed
> standalone. The NPU domain's domain-supply DT wiring follows in a separat=
e
> patch, so this change alone is a no-op at runtime.
>
> Changes since the RFC posting:
> - Move DOMAIN_M_R below the other DOMAIN_M_* macros so they stay
>   alphabetically sorted (Heiko St=C3=BCbner).
>
> [1] https://lore.kernel.org/linux-rockchip/20260613070116.438906-1-midgy9=
71@gmail.com/
>
>  drivers/pmdomain/rockchip/pm-domains.c | 36 ++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 490bbb1d1d8e8..ba66ae7194289 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -204,6 +204,20 @@ struct rockchip_pmu {
>         .active_wakeup =3D wakeup,                        \
>  }
>
> +#define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator=
)      \
> +{                                                      \
> +       .name =3D _name,                          \
> +       .pwr_w_mask =3D (pwr) << 16,                      \
> +       .pwr_mask =3D (pwr),                              \
> +       .status_mask =3D (status),                        \
> +       .req_w_mask =3D (req) << 16,                      \
> +       .req_mask =3D (req),                              \
> +       .idle_mask =3D (idle),                            \
> +       .ack_mask =3D (ack),                              \
> +       .active_wakeup =3D wakeup,                        \
> +       .need_regulator =3D regulator,                    \
> +}
> +
>  #define DOMAIN_RK3036(_name, req, ack, idle, wakeup)           \
>  {                                                      \
>         .name =3D _name,                          \
> @@ -241,8 +255,8 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)             \
>         DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup,=
 false)
>
> -#define DOMAIN_RK3568(name, pwr, req, wakeup)          \
> -       DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
> +#define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)               \
> +       DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
>
>  #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)      \
>         DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status=
, r_offset, req, idle, idle, g_mask, wakeup)
> @@ -1274,15 +1288,15 @@ static const struct rockchip_domain_info rk3562_p=
m_domains[] =3D {
>  };
>
>  static const struct rockchip_domain_info rk3568_pm_domains[] =3D {
> -       [RK3568_PD_NPU]         =3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),=
  false),
> -       [RK3568_PD_GPU]         =3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),=
  false),
> -       [RK3568_PD_VI]          =3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),=
  false),
> -       [RK3568_PD_VO]          =3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),=
  false),
> -       [RK3568_PD_RGA]         =3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),=
  false),
> -       [RK3568_PD_VPU]         =3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),=
  false),
> -       [RK3568_PD_RKVDEC]      =3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),=
  false),
> -       [RK3568_PD_RKVENC]      =3D DOMAIN_RK3568("venc", BIT(3), BIT(7),=
  false),
> -       [RK3568_PD_PIPE]        =3D DOMAIN_RK3568("pipe", BIT(8), BIT(11)=
, false),
> +       [RK3568_PD_NPU]         =3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),=
  false, true),
> +       [RK3568_PD_GPU]         =3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),=
  false, false),
> +       [RK3568_PD_VI]          =3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),=
  false, false),
> +       [RK3568_PD_VO]          =3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),=
  false, false),
> +       [RK3568_PD_RGA]         =3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),=
  false, false),
> +       [RK3568_PD_VPU]         =3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),=
  false, false),
> +       [RK3568_PD_RKVDEC]      =3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),=
  false, false),
> +       [RK3568_PD_RKVENC]      =3D DOMAIN_RK3568("venc", BIT(3), BIT(7),=
  false, false),
> +       [RK3568_PD_PIPE]        =3D DOMAIN_RK3568("pipe", BIT(8), BIT(11)=
, false, false),
>  };
>
>  static const struct rockchip_domain_info rk3576_pm_domains[] =3D {
> --
> 2.39.5
>

