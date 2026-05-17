Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA90CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47IgD0Iol6l33UGUteMSnMp1BqqYxxlTxqbsNmGL4o0=; b=MdAViSt3M+ZR+l+LaruuIY54LS
	XLU7E/2jAaGQahNKLJlKEyU/LQOO8RTr6YSAs4pnfuc/0Bu6i5Q6C9Cfn73ObJt35qvB3Ehyiws5V
	u2dzrW81jlNoSoBYFmlRuGkSaD21bGygu2vyCy79gHZ3cesQ7w6/pAn7T8ZT01wKR/qPSsCdbNnDJ
	1/k0SYM743l/sY15WrLwpaavG6tJT+hg0LpMWlPD7z6GlmABaX5KbEaexi2Z2tf8Wbn0BrO8Oxel0
	7n7NIWF8eExiAKet4Nn2pEleIJzeFCsT1nigbsedbS6Zt7FaaT7apTPHDwz0LPPjacghd8Fzx4Fiw
	i/Djl9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgCg-0000000DDz4-0loK;
	Sun, 17 May 2026 18:27:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgCe-0000000DDyc-04zO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:27:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H1Cj7W1672239
	for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 18:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	47IgD0Iol6l33UGUteMSnMp1BqqYxxlTxqbsNmGL4o0=; b=SSmJ8zbujuLqmSrJ
	hP4SOwcuU2/B8tj4fWaGfPBNfswDzwWRaUaQMHW70GI3sgVxCVQ7v3ipcL/Pk7Xf
	9ijtK7lEPicROvKX95rXsAi5bd4oB6Mzz3zVyjLv/xXx4axbdrJAB9Su0yCxVfuT
	aqgwaDyVCDhhP73wUZQ2uA+JydvmdKJcyIGFsonoNeh+T1D0K49nhik/l3ThtVb1
	oGRMZNV8mQmfnsT7hUk7OUdc4Km1xVeBqpKPHT6D1xgY0ZSBJfRuEOaPZhmsHa0A
	9O/OhHgFGf7fxFK01WyVOmONmMX+R+of8+EmEeN8mEs/ctRFKjgB4WV8tTd1CDvn
	ejDWNw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g3bd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 18:27:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514d2b22e7fso27445001cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042422; x=1779647222; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47IgD0Iol6l33UGUteMSnMp1BqqYxxlTxqbsNmGL4o0=;
        b=OPw9KN0eu/HBFbrkvDHwJvtMhU/M8FTC4zZfmP1chDogDlzgjpIgKbcfaZlDzcSpZf
         F98FU8daFsycc/PJc0R+LWqavUfFdCjeSpn7eGP8Gw/bsxQzsk8NxA/RmkBXggrKBILw
         XBapU/9xjjWmklQUiJmDH7dqhTTz8K/y3i8e5qudzvi8qqIAYL6ZDXhEvi8vW/oUFuMI
         TDisI2QeJLsE8Pb4qVav91/8kQVN6VxvlS3SW7SqqHq11UE/c+Bt0oC7C7jELURtJxOj
         A0xC9XlUvIPH4wpWalTVhkc8brgr7bfyC7a3D/404pizi18T44D8wPx2dehjxlxEorYL
         Avaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042422; x=1779647222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47IgD0Iol6l33UGUteMSnMp1BqqYxxlTxqbsNmGL4o0=;
        b=V2jMe1IKoESn1lSwuHPp2EoKFYfD3vXafoCG2COTBSck6v2LdcD2tC1dLOmNUwYRpG
         LEW+98NyV2vPg+K9zHV1A4Wi51qIAFBcibIyArjUU2OLkyPO2Iz7fyd658QISKS5fhLe
         iOmHJZpLXYMdOU+PQQtmK9AKknc4FIL9ht2iXDZjs4DV6PhukYK+FI8B47Sne+SHHsFZ
         nzgt6SV9jeJZceAFeVgkZknl0nSd0Fm7QaN8DQzUgnDWHh5Fy2NZy0pfbFD8yQXjyAcw
         gpbwkMbNDQhSfLQjE1H/ALxytxKxnuEl/tjNu4heHZi+m1hyN/7Vrq8Uz20Rl/qW3Dw+
         Q9ww==
X-Forwarded-Encrypted: i=1; AFNElJ/NZ0m3wc8wZQLO+Alaqxm4k843/bi/fh3DPWHYTUeVp6bJ2mWRu2iyUMAPdMdPjEBw7X8+h1fJlSuBo3+p1QhP@lists.infradead.org
X-Gm-Message-State: AOJu0YwZdejqY4zqIsZLRU+Jl8lgR2bw2Z52WkaZHT4cHZHi9DEh1PhA
	+SstjxzW0taTg3T7xo8hlEI04k2VFvAOHCUo3zmz/Lwf+OmiWdgfaqGsqb5bWTnTU9Syb7QCAjg
	n685oE5/wn7hCDhoObHmqgqGXlzVsFLHie1raeDP7+mFjm1laQrxJkhjePu+dMz8LM5QRp+6wdz
	03kg==
X-Gm-Gg: Acq92OFkWRU5WCds681Yvbq6vCz6PJoozbIj5ZA+Cc/2NGxUNczfC3WRAF6Z3jxFhWR
	2UdGAho4lXqp4FK1KVKZboSNjn9kznDWkVPMC9lRQZX0Huyjj0nWqxPj7cHCaa5jCnatwSyEfMx
	Ks4DKkOCd4OA/LuS7tqhyz8n1GeQiy88ZDFUoP//bgmFQWpQ9L4LQ2SDF4GbGO8AbdapFmf2DKK
	TYWYn/PvTE2w5NGjl9ZQyZ17BKz8OrMoKPT3Iw7iwaMBIkMJDD0m5ldOdOIYH9XH82A/Bg/ooDx
	f0IABITurgc9GbcyS1euYC65KPfzasKbhgct77g2w10KZHJblwDXKTFxAx0YrvM5HzAcg4tpdyJ
	JtnT/QbY5ZweC7OVAU6EvSS6df6nZgB7HDv1FYUxS5jhkvkxsD02v7j4GFlEjncSPcqVPktjvMl
	VvEexMG957eK0jFBxoeN7brzvlFtswXsjDNKY=
X-Received: by 2002:a05:622a:901b:b0:50d:7d8a:5d45 with SMTP id d75a77b69052e-5165a2754a0mr151817741cf.36.1779042422420;
        Sun, 17 May 2026 11:27:02 -0700 (PDT)
X-Received: by 2002:a05:622a:901b:b0:50d:7d8a:5d45 with SMTP id d75a77b69052e-5165a2754a0mr151817231cf.36.1779042421835;
        Sun, 17 May 2026 11:27:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c885sm2814535e87.11.2026.05.17.11.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:26:59 -0700 (PDT)
Date: Sun, 17 May 2026 21:26:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
Message-ID: <vjdz65uy4pxlbt2e4wlwvdu5llwazyopeqb3caswvejenm5iv7@3s3p7iz4otef>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
 <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
 <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5OCBTYWx0ZWRfX466cYF1VPeC0
 eXgEwzqOm/75JE4QcLtvULDYAgGDfvbvSfxiRhIrgPF9a0AlbsGFr/hI7kE695U+R26zAStYVow
 BpdsZYEuos1q3nvN5WiqzqfV9+u0gOtXfuprQAK+k2fuTpwhwA9JsnfANvulPcGvXlzy+yGC2gj
 JEb6Cfll1IrRuJ8t4T2oAQYswf1W0s8pP+6nZ8U4mgOiU1R8xRyqhz2lZyWOT32lJ13rjxSuDUB
 lslXlIkDSMZBkch8iQhStAWbFWGEBlMqxK38UpiY1qNvN1J4lkvFrzrms/HdhAjencFl12uGjS7
 FKnihS/+PPOXy7HeUPrvjLO0DIKp7QRyRTs55wmg2Gc07fSFWJRfw4R0zKyzP5sqw0FeFqg/XhY
 298SepIznQ5uQ7NhNEEpqzDu9l60wGI4AgAZmY/cFFpZkzZkALJkifoptSBO1IXFDed4Dc+NIc6
 s69BUCiCCrolWo4z2IA==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0a0877 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yUhn81BH2gEySD1AKRsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: feFMYhy2hNj_rlijYsxoET9RczHoH6-M
X-Proofpoint-ORIG-GUID: feFMYhy2hNj_rlijYsxoET9RczHoH6-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_112704_064157_6E0EA758 
X-CRM114-Status: GOOD (  19.90  )
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

On Thu, May 14, 2026 at 12:17:54PM +0530, Gaurav Kohli wrote:
> 
> 
> On 5/13/2026 11:23 PM, Dmitry Baryshkov wrote:
> > On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
> > > From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > 
> > > Unlike the CPU, the GPU does not throttle its speed automatically when it
> > > reaches high temperatures.
> > > 
> > > Set up GPU cooling by throttling the GPU speed
> > > when reaching 105°C.
> > > 
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
> > >   1 file changed, 135 insertions(+), 30 deletions(-)
> > > 
> > > +
> > >   			thermal-sensors = <&tsens5 0>;
> > >   			trips {
> > > -				gpuss-0-hot {
> > > -					temperature = <120000>;
> > > +				gpuss_0_alert0: gpuss-0-alert0 {
> > > +					temperature = <105000>;
> > >   					hysteresis = <5000>;
> > > -					type = "hot";
> > > +					type = "passive";
> > >   				};
> > 
> > Why don't we keep both passive and hot trip points?
> > 
> 
> Need guidance here, we are keeping passive at low temp so still hot trip is
> needed for such cases.

I think we are saying the same. Keep both passive and hot trip points.

> 
> > >   				gpuss-0-critical {
> > > 
> > 
> 

-- 
With best wishes
Dmitry

