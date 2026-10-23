Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41390606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TqVM5pps;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moYOHMFI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R4H1ZEd5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=; b=TqVM5ppsOBGRCoIM+yhwT8ZzV2
	ZQavLKcueHWMCov4LF4DkwfEbjp3eZrUduJMR78m6BJZngB9SWPnc0GZ93DCeX9Y5xCW4Zm6HCgXD
	4LTqSASwXgt6c3uRCPqxsl0gP3T5zMrkPaIJres4BVNnkTVKNWnfpKijoKiqgHjTKxGH4rlojSmva
	3ijOpo7ESZkj9yRx8srNbEtpcv8RGQQeNz8tHp4+8TRLL76ZVeJEOotU1SjQzEcGV2udrwxEix43d
	8nkwLOCE78qNfjYiTMgYRFVv1+bG+WUaM0BlKxAU+DQUbdwvDF8uvazmUKEj4SDXzH5fZ6rtWhmi7
	4T5vnWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOoj-0000000HB37-0LyP;
	Fri, 23 Oct 2026 23:36:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOof-0000000HB2l-3tzD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:36:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLurWe877073
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 23:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=; b=moYOHMFI/3MRcJDz
	ZA8WnN7yEfSkWsyYp8v9+QFucDkTCQC8SKcTMqg6RzdAtSjs3QzyZzQWJj0B/Ck0
	RUVQ95Vua/zwF3kcxhebMt86PgFMZy42QbaGG1wXhzJI9u5QVSOEYPxzcdwRGL5g
	v8e/Cwpg5r/HTWQirguGNfljG9bsB9eUsY068Ty7mtfFWZ0WCbFD0USBCprfm2Cv
	tP4D5MY2tkdIdOtYAMZUXZa5Di76LOUTGCgvyc8GSjD9Fx7Ln0TieTpXRURC96qg
	+UKV4UvxmqsF+PWNhqI2HT9ElC6Wn/6oWhECs9FABEYmXr70LNHco9j/K0M4FKGi
	fs/lwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr68waa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 23:36:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso175560985a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792798612; x=1793403412; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=;
        b=R4H1ZEd5Tb3iXHmo8OlIb4wOPl6l6fYdLXXTM2WTn2ul7lTaDXs7d74OevCl8lVltz
         9QcoLNWA26EkdR6ByDGmdQ5uZ+XfcN3HYulgOipSBUpONquvDe3lJEOjDUTGiRiAt3M+
         VHHXR+grRsjfaTR9UpeNCfNORZgPQW8X2XAoQ7bLS5EaPGVRA8LyIlFubg9C395BMhQg
         GJkFIHTo6gO3+xcN7EKCapjubCZYtZhTZg6TYGtqVwKzZ9fQg9Wj93m6uvlVsyOJ7VSV
         JhRPxmRb0lkj6ygHQvdpknlw1oCdH9d37C5owp0SBcPNi87uBgVUSpfsTGfxBYy/kbip
         vkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798612; x=1793403412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=;
        b=jcYjygNHVXypUNe2kVxvsuy9R5WlJGyBoqtOult9v+4X4OtiWbIQrGYg5A4x6Tzp3A
         ER6NMD5Q96HPCjjHYB2YxEcq2fcasb3nOWeghWmWyj+7FEWqVpMpXbgv+FutaTN42gX1
         vBtx6GyVutKtYivU7CJ8DXX6c74w6NLHxwzYQChOj2xliBrCLVZ5vp2EgYWuxMM+o7Cw
         VFRE5qm2vLDRyMiDnPolz+JxoXRU3idMVOksfaA/E/gSDjrvDuH7N6R+4nHRakzkylQr
         YNAWlSuVYAqZfrCQATUrCkGK4l2BrGVt0C2nPAdxWm79X+EB3IpDu2kXHQ0U33nKnwHT
         JMLQ==
X-Forwarded-Encrypted: i=1; AKwUvBybk/Tp1n/oLeYoqsRMZikq3Ny2cVkCw0gcJlw0GKxT41n1ueWVpmgLWoJrdGUl1nYBDOYfIPjbCMqUWewoQgqd@lists.infradead.org
X-Gm-Message-State: AFq9FYJL+qIxv1+M34zU6PgVE92KBZWPZBf9bM73hBomKYbDsc2ogY6T
	0kDt5D/fRhiZm7KkujGFieuQn8BywacBGRvunWTzWOV5ZUWL7oA+SFgpjwt79CsZx2S/3zTeIYQ
	bMzMVXu6BeZgCurJOLMjKATiXO0AGjqKDIEsNmZbcKVC8ITfrvn7OuMvpAJJLE+Der+7fYNYXfk
	o9uw==
X-Gm-Gg: AYBFou07axQTBlUn6ZaVslLvF//j2sloCxhmk2sPOp4tKL0Cd/ATlREVvC7C9SFQ0yS
	kAfi4/0cLVKAJ7Ye4LFe6s2f+B8ljQiDAjh9j+iA+/6XpJNsgaWUI5I6+1x2v2rUajNDHbdcxRt
	UnDLnn5bZ56KNTvRqlPPSM+ZncNE0LK12JXkkqnhkKtqXckqHdCj5dPjQwHXNvYuEeNImqe1vml
	PGzjf1OZ1ddndLDLxrQKKwI7G7B0VDQqF5g56oQiCzAJO4Iy8z0miSVLzyWy7N0qas8WvxErKl6
	+XGfPnU5N5aCth8Q4vYDDgl+knfIEQDv+sbTktXfCJLILJGV8vqa3UPK6BgZasWHE2vQuEg+jvk
	NeKKlp1q26KOcc5dK735lKWPDXe6jqL3XBhRd74R4iM1lStMZGqXJUAz93Eum6jD4GiX0riRV5g
	Y0Pwy5uWAUTs9/
X-Received: by 2002:a05:620a:370b:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-940ef938f5fmr84044485a.31.1792798611950;
        Fri, 23 Oct 2026 16:36:51 -0700 (PDT)
X-Received: by 2002:a05:620a:370b:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-940ef938f5fmr84041285a.31.1792798611386;
        Fri, 23 Oct 2026 16:36:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6b051sm67463e87.14.2026.10.23.16.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:36:49 -0700 (PDT)
Date: Sat, 24 Oct 2026 02:36:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6adbef95 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=9jRdOu3wAAAA:8 a=s7fkfekX88plzggl2-cA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MyBTYWx0ZWRfX99pGF+P30zUv
 0UgbqgjOIQHK5yxNky7ErEOSDwpgHpReIGEthFMdDzj5U1PLsLHnSGh5wSqZROwk0uoWtLfKWYO
 xmdChky6ZVQfqx49gboTFMhbKwXxUrWSrELFc/Zt9vR25dDbsxNa/VfmkJSp7lmOsx3wZ9tyIQA
 QPTyd/IuTaDQPbvo2NLlz6HQRaG0ev3Yspc1ruzMhvzxn3u29rYdHzqAwyscnC/Mq2Zkvkv43TC
 CNAsZvEEGoU1Z/Sck6KtiqN6PPzIr5nP+9tbe9uJpJLHKoHYjPO2KLvfg8G7FL9FkTVY1VAoYMH
 MAQ3uCOVvasYgOejYRh79pMV33yPFc40AFeYYQ9yfrD64XXBx7C/V9EzfTEWN7++DEkUPE/47Ur
 3oVZ80IQTSZUknln1/84fKE9rmtpFKqzxv6A1dqBF+VI34Y/90ErwlDT/ZbwpDUxCKAAsdI40d3
 SNnpw7uv0bfr1eIQujA==
X-Proofpoint-ORIG-GUID: cLQSHTQ1eckcZbcj5WI3Wcv-npsry-gy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MyBTYWx0ZWRfX+08Gy89+rRHk
 ZxdXRzXkhg/jhf5T42LnAkK+gj/K+jtOMYrEeT/HeIs3JkNTkA3z0PGarNbVr7C3/jDwM22UpSn
 S3ZNY2WexlsP68Hg/OyUc8z+MCTSziQ=
X-Proofpoint-GUID: cLQSHTQ1eckcZbcj5WI3Wcv-npsry-gy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_163654_000267_53198B81 
X-CRM114-Status: GOOD (  37.42  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:
> 
> 
> On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
> > On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
> >> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
> >>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
> >>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> >>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> >>>>>>>> In order to associate the SID used by LPAC to it's own domain and
> >>>>>>>> context bank we need a separate node on the DTS.
> >>>>>>> Can we use iommu-map instead of adding a new device using the same
> >>>>>>> addresses? You provide zero explanations, but it seems like you are
> >>>>>>> trying to separate a part of the GPU into a separate device, but it's
> >>>>>>> unnecessary.
> >>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
> >>>>>> context banks.
> >>>>>>
> >>>>>>  From what I recall, so long as we use the same dt node, the iommu drivert
> >>>>>> provides no way of doing this.
> >>>>>>
> >>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> >>>>>> and secure.
> >>>>>>
> >>>>>> The address on the lpac device doesn't really matter. I have very limted
> >>>>>> knowledge of DTSs but I think we could just leave it out altogether?
> >>>>> I think, you were poined to the Glymur Iris patches. Another option is
> >>>>> the QDA driver being submitted too. Both ot them use iommu-map to
> >>>>> describe the same usecase - a set of SIDs which are used by the device
> >>>>> but which should not be a part of the defaut set. With it in place you
> >>>>> don't need to have separate qcom,lpac devices, no additional properties,
> >>>>> etc.
> >>>>>
> >>>>> I'd recommend following the same approach.
> >>>> iiuc, the conclusion in this recent thread is to use child nodes for a
> >>>> similar case:
> >>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
> >>> Let me check internally.
> >> After a brief discussion: it can be either, depending on what suites
> >> better (and if you can persuade DMA / IOMMU maintainers to let one extra
> >> bus or not).
> >>
> > One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.

The rule is the opposite: new kernels must continue to work with the old
DTs. If the new DT breaks with the older kernel, just specify it in the
cover letter so that Bjorn doesn't merge DT changes before the driver
changes find the way into his tree.

> > 
> 
> + Bjorn/Konrad
> 
> Not sure how strict is the requirement for compatibility with older kernel version. An
> option in your case could be just do an override in the board dts file of the
> Steam Frame.

Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
only used by the LPAC?

> 
> -Akhil.
> 
> > Not sure how to address this.
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry

