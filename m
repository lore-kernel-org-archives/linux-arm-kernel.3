Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AF2CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TN7+hMpDo5h/8U2Db7n/NdrmG2ZsOSEUMs79Cs5uzu0=; b=yrvaovc18g1DVdXzI+QM+Mrjt0
	1WGaP6p+TLsETK/d0Wh71z0Ws1yWBN2D3wgs6oaUF3iMlVuBDd3V+1aHU8qz/pS/Rg/iLzjsmMSeE
	Rxd8ywT2Pmfielk7buZvaKpbQ5Mc7MWWeAEGu4pnA9u4jJW08mFwiT5ekUZKV1AiEIevYLSCrFvu4
	IzPqAEti4Mz3BgtlZrCe8/eX/Fv4NZ5lqgvT+Qr5oAxHh/DL4CPlEj7UjXXcsiqWia+nT67x9127K
	Yx2iBKy1R3aCdjD24FitU+J9OjSC9/yJlLOYzMgQcEztrUVbKs3kqikHHzBRHsHQLcPD/ob4C5mzq
	rAlUnFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vARz1-0000000AyUs-15Zc;
	Sun, 19 Oct 2025 11:53:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vARz0-0000000AyUg-1pjf
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 19 Oct 2025 11:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TN7+hMpDo5h/8U2Db7n/NdrmG2ZsOSEUMs79Cs5uzu0=; b=rXzOM/Dleq3nGVZRMhj9OcYg+Y
	DzG+d03fF9yepMaGimq9HSyU0lvqi1W5BD6aB7jYdHTDF6wjlE/yygdGP+xyn0mb70sEwkvnDlyvx
	HARlKb7/eUYtS6bR0vKrkyrf/zQbfZtye/qumyZU3SFss1Js11KZlKz6i62DjqR+EINUQwwwHWkp0
	Zq25/pnPPSYfFCC37iyNM7l7g+Tx2zfjRRmjDJgiStb9cR+YhMMuY9y2H90KQ45Z+5FxqS4GoAtpp
	AX+V07IIpiM/F4x3JH+seKbJo/Gdu7rD6YAB7Drb1tRU44zXocKiDHLdQSvpk1nU/9jiJ+0nATCg+
	ykMSC8vw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vARyu-000000091Kk-0DOs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 11:53:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JAn6En003770
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 11:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TN7+hMpDo5h/8U2Db7n/Ndrm
	G2ZsOSEUMs79Cs5uzu0=; b=ZG6XlRve7QWzDRwvZRk40ibakpaPla2Tq9keXomE
	hVETZk2RE2Nl7pXWDKz1+4ZwjmenUDh0h6EtOA6JfYP/lR84itPZwh9NeFycO+Eh
	Fp4vwiK+PZjNlguvBxrr4CFHXHBvDfg45enp2RG/qI2sUIfHfX9T9e0KuXao3D1U
	lPu9SrnsZXkjoTcZtX5OB/GbF0Axa6cAiOdJddtS9EGFvf20k7l3bjhVdPJFknCV
	mERaatKCy8x35whZu4M1BGP7wD8m0ZSZETNFIeMGvtZRey/5D7TnTLgiYOjeIyZI
	ZMJ1+TkZNLVf6FXKNZXcmYGrLCwdNaVBUV/80Mm0JOczIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v39829c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 11:52:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8906059f6b2so2015873385a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 04:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760874775; x=1761479575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN7+hMpDo5h/8U2Db7n/NdrmG2ZsOSEUMs79Cs5uzu0=;
        b=O8B2xTuFskm2UpmVtC6t/P/NZYf2NPi3apomqywvCYRIdjJX1NQuHHje5Ehl2I5+4i
         8EM4uznFiAqfSo4AIsdfoixwiqAEbAF9Ak4Pj9BPfrHDhf4mEojvEfkbQfk1x3EuHckG
         xj+I+XN96wamXrFbp5kBv2nIsVSVSgpRGqaBEf/jiwZhfXCniWZJaTnzR1MKvaIOmo10
         JGghEm+S4LNTDdE1juquRZR/fPJqmhV5/rmjmf8AO587tFqnvU5UTVPq74CaQvhGM/q6
         r/FEtyYEFwBmtEBZHRKa81Dz0ATrCx+TBcwTqHJOLPT7qbqrqkh7oWEBRfneVrHVALiW
         TJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCXER5UeTn7TjlKWMlWPQ3IQSqOjVte3AwcgBKAA8jxaX9+fuGYxMQmdVMnVsGnndpjksYlxEUcIZgF0ip2LtXyh@lists.infradead.org
X-Gm-Message-State: AOJu0YxQX8WOwtXMuX4ELyxUqXgyd1l0PgAodXQs8oSjkHRAD6D1mzVa
	DBPO+RcbnJZlf4VgPjGxxU54pBHo2Vubmv0nG4SsRmapm0zL3MI+podkFpXi/x11qjKORyvU5KJ
	IcwelLRhYeJZG0sVAls9t3PTG5u+FTmVo0cHZE576tcSnRLpnNaum7sdLnXqtEZo0U34Xtyemjz
	kqOQ==
X-Gm-Gg: ASbGncvtqXOpEgKtzzi0wEt4K6YA+YsTJaVUgkjMrDByYkZB/ybX2Veu9cSxyaUf82j
	41C8y/cwa2dFIM0njnao/Ul6gWdRkTwSyO6/7Q7O0T8JkciVqLKBe5zARn7UKZAyy4i39JcrHpU
	tDINwobM9FGY9pnIiXokbWwoFYR3nslVYF4mTiLGuzhCzFHZ5L/b1AJdHEieiJo8nHe23XiNcF2
	jO7gBcbzl/uvrfQUjWZi+6T+N3UGKX/HosMaEOsNJSfBteHRt2WXhwOoO3NkwWE77iAA6lZmH4G
	gV2COFr4Pe0Yq7zref5LyP1Ig6+Xe1InIu143B0CL/ejjsiiI8dveRLEPuwnrCGCFXtNpIjwaKU
	PdW6wxUZqqyI8dutQTPle/QVuOYhFrSwjReXL0mbZTF05/iSPUAcq6Li+NRD5JutoOAHgihK1P5
	0992xGfLl181c=
X-Received: by 2002:a05:622a:1812:b0:4e8:9402:a809 with SMTP id d75a77b69052e-4e89d263d69mr120018951cf.31.1760874775007;
        Sun, 19 Oct 2025 04:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPcnFN62n4rxi/er56tz0GO9JJVb5HUURvhr8kT25MVhi+bHd5RuXDHCFN4GVJs/pYXza+tQ==
X-Received: by 2002:a05:622a:1812:b0:4e8:9402:a809 with SMTP id d75a77b69052e-4e89d263d69mr120018661cf.31.1760874774327;
        Sun, 19 Oct 2025 04:52:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def28beasm1501207e87.114.2025.10.19.04.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 04:52:53 -0700 (PDT)
Date: Sun, 19 Oct 2025 14:52:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, quic_riteshk@quicnic.com,
        quic_amitsi@quicnic.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Message-ID: <mxim7iweydzzhetqlao54hrd4ntufdhwdsbaunblyhlovdv25z@gct5iydvzbzu>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
 <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
 <62nvkgq4f5hoew4lbvszizplkm67t67dbpskej3ha6m55jnblx@vajuvual7lng>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62nvkgq4f5hoew4lbvszizplkm67t67dbpskej3ha6m55jnblx@vajuvual7lng>
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f4d117 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=vRBcCzbY8zNoOr-dCfEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX4QzS1TgWLG9I
 8seIEeAHnq3SFMtxgSCY7u+aULCR0ec/KUQvHHQKu0J0zHBG99ORE558L9IbEeSaDbqabZRf1Z7
 T2+9Y5MnkYoOyorSNAxzMTSBJl8uCRYRpN+iKv3Zvq+pcRo/GgozRgS5L+EajPy2G93u+wWaIOk
 C5H2SNVyY+2V9Tzmje876axJSX3/Kx606CwwMPD6FsQj8QoNQH9HfAy2Oj3+qRitn7ynJVMMQEh
 7eq/aOEAL3q7fRXMcMJybC0zyrGMKMvkyi4/LqeGUBI114V+qBOdBq8WKTebDCx2cXe5GKtNxRK
 dyLhEedyFhsFh884te+RDhTWUI2cTQdGhiCKJRK4CQb7JO1efzJMxFG1GTWR4JiWYZ7Ca3OaxOR
 bhawZ4zYvPdYFAv2TGYwcVXwgwDyyw==
X-Proofpoint-GUID: EO4IOP8qlUgnlgIu7exaglciswv2634Q
X-Proofpoint-ORIG-GUID: EO4IOP8qlUgnlgIu7exaglciswv2634Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_125350_053860_3C085F75 
X-CRM114-Status: GOOD (  27.63  )
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

On Fri, Oct 17, 2025 at 03:54:09PM -0700, Bjorn Andersson wrote:
> On Wed, Oct 01, 2025 at 11:43:44AM +0200, Konrad Dybcio wrote:
> > On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
> > > On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> > >> This change enables display1 clock controller.
> > >>
> > >> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > >> ---
> > >>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
> > >>  1 file changed, 4 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> > >> index c69aa2f41ce2..d4436bc473ba 100644
> > >> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> > >> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> > >> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
> > >>  	};
> > >>  };
> > >>  
> > >> +&dispcc1 {
> > >> +	status = "okay";
> > > 
> > > I think this one should be enabled by default. Unless Konrad or Bjorn
> > > disagrees, please fix lemans.dtsi.
> > 
> > Of course there is no reason for clock controllers to be disabled
> > 
> 
> On SC8280XP we have the same setup (two MDSS), there the clock
> controller was left disabled because not all SKUs had that IP-block
> accessible.

Do you mean some auto platforms or something else?

> 
> Whether this is the case of not for Lemans I don't know, if it is then
> the commit message should have stated that.
> 
> Regards,
> Bjorn
> 
> > Konrad

-- 
With best wishes
Dmitry

