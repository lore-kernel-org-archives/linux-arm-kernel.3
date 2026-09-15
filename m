Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E10AC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9qFLTvgJUSRq4Cj2Lly0+SKYzt9MO14DnLjeqUt63c=; b=1raWoKmyfTxTp+C0FXXojLZqr5
	sTNwUN7ZZsVQdnHBTgEbEOHrKs8jmC1a7ayLB+dtNvfnExmx/SbnubBTLJ/1Yz+YRWD8JFLVL3DZH
	Z3gygCtUFIAZQ7sZ3mQpfxv69tXuG7XfcmL8fyNTERC6n0KiMFtm4NaJ7zzfUsi2Tny4aVXtuX3hj
	eRui+zdHr8JVU9rsKlQ/Rt95H8IDgc3ip8pCn4eNH+Mvwn1zf34v0Uer9KkX4IOFHmYOh7oDb8sca
	+//quYA4QTOTN+1Y+tp9wvPeJEVXm+NONpz2iHGAc6EC+u8r0nKIXAJSCsUKCu5XV1MBY5B82NNw9
	ttJyEOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SYH-00000006auW-3h3Y;
	Tue, 15 Sep 2026 12:46:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SYF-00000006att-2TFV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:46:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gxw13415569
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w9qFLTvgJUSRq4Cj2Lly0+SK
	Yzt9MO14DnLjeqUt63c=; b=VJ8uhZ4VK5CqTV/9wDmgaAd1dfmS157o9prMfpTU
	gCBQh70HIm8LpBfWSYGmPfr6OWcIYS8kgqe1iNQS8h765EVRAAp7e2340EcnhwFP
	Bxqf93SPqZRC67MkUWj7Ve3B/txnbBVimzQ9JH7ZfWfhMXn88B+PrW+A1+JuTguE
	+8HnP8R526UC1dEfybqYaLxHDwxTNJoboNtH4snUilNxLPFpUtu+QGWP3y0JCIMK
	R57X+Ybnw0aWU5MY5AUDTvbKrZJtsZodn2U+4j2i3XUaDmVhqw9Qq/fmy8uk9icg
	Y7plGtMbsTzKNiUPv+HHqEZAWvjDB8dXr20wVjL48CvAog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc0xkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:46:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so687070685a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476377; x=1790081177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9qFLTvgJUSRq4Cj2Lly0+SKYzt9MO14DnLjeqUt63c=;
        b=LmU4v9UfN7H70RFqujpMskcuU8dOjTtEo/T9r7lFhENmujKO1s9Y1swMvHD1qiXLMy
         kGmZAe9Pn/xoj+VF3eyw64iWcB9vCtJsjHALFN+eEUWkaz6bkUODrQprfuA+O+3ur6as
         infMq02OLIcwGjJ+M2Gn7oG3kNljbUUiWRz4WGFUdmP5tfLGfTaDDBzDJCZee4nqJvsr
         aL6G6W1mzvo7OP9KaK9u/t1ZxHTtiz+HVj/Sk7m2+NG8+wxDmxFBC9yo0A0E4ebV+QQy
         K/Vp6JASeI+mG1i5VN0HwiC3MRdamR/X7QbzZLbfypKdaqrAHyhbx+0GfIs5kin6QDiD
         COhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476377; x=1790081177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9qFLTvgJUSRq4Cj2Lly0+SKYzt9MO14DnLjeqUt63c=;
        b=YZxh4BTCD5YiJQ/xU9sPCBRXu2suTX6MTf16Q6vc58v1NhlC9oJPKSnqNs/IxeZUqn
         AqZVCunCcC7leBvxLxhq986K4iRW5vgk+87PTm5Gv7zbrvEausdFtuzsHc5hcc0IAOu+
         TZ0zZdbYapcnVVsVjjfFqBnlFLGNQqfj8rBrI4AYqz6apToC/inU6nS4FM7T6Z4dF9Uy
         4NszVZFb4SuYCOf/w1HV6JgqQ+NhXD31nF/Hax11J9TGO4uxppdsoBxVGkYK3/Ydh3gb
         NZS/PQaDDhu2Ec7uKiBAsHvNYAEp5Q5zwK2v4cG8MgRnbf1IvIqZaGBcSAQ9iBjhwKMF
         51nw==
X-Forwarded-Encrypted: i=1; AKwUvBwSh9hsZ9XfnqLW79j1I46qYE3wlEdcXByhYH5tPO928V0sKlGMlqmhukA+p3vnfjkWAfGqQN41GEbUmxjJr9lQ@lists.infradead.org
X-Gm-Message-State: AFuF++nG/OUNnOiDDy5d8Lju83uMHsLdG9Mpcgi+8m2FSxNOOqyqywPj
	3535ALnAdHW8nTr3YqlBvuknA3nlElnRpT8uBO4MkCexBdopFP30PRNNPAJoFpTTUZz1ji/BFCW
	l4ACtvFUVYG8kLFrUrIrvYp1X7ogSiEe/XQSITcJ2C5OrM85vA0QUAxHIs9UFegMcl+mj0k/hlx
	+GJg==
X-Gm-Gg: AYBFou10e0mfLpjgicASCcLj94ePizq5+HXRrN18Ar52rG5v7nnrB2UEre8zgns80/U
	04JS/9y0KgLVRR2AtRegWD5NWirEq5dzxJHJ27LkFUhgMntZXLdaCZyUQ7WtnF+fmi6phf3EML+
	5NgkNm/sk9EhnWqiTOhylmsaBubTA1LsEoaHJRyvHamOsMeT5+vSG/4V5PQEOazXTdTZAytB8/k
	xBZdV16K8Mb/l7PFhiDFZ1idEhb+jo3cekK65mlun5EQk8zReAEmG5GsnkHzZZZWskvo0wJ5YUH
	zwGKjiy2CB9DJcfWMLs3M2ySrWS4MK6RmSXcxP2PkcALFkdGA8nVWqDofTuIEl6FoMj3rDgmN3a
	HuyN2IENiKOdAFA==
X-Received: by 2002:a05:620a:4542:b0:938:39e7:725 with SMTP id af79cd13be357-93a299a0369mr962788985a.32.1789476377238;
        Tue, 15 Sep 2026 05:46:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:938:39e7:725 with SMTP id af79cd13be357-93a299a0369mr962783085a.32.1789476376693;
        Tue, 15 Sep 2026 05:46:16 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm28920000f8f.0.2026.09.15.05.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:46:15 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:46:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mostafa Saleh <smostafa@google.com>,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for
 QoS settings
Message-ID: <454ljf5swr6fqigv43pv467liciyzaez5f5mys4366qywqqoco@rdtfoinr4wsy>
References: <20260907171729.1735641-1-maz@kernel.org>
 <v2gxqazjoxe74q5364jucy4pjds6gx4gfdchgulekl5mwk2azk@we4ibolioibm>
 <87ld9c4vc2.wl-maz@kernel.org>
 <6iixty74opjqkegpdmtytffgrllcjvrmhlsv53xtackdqzvwge@6fh5onz27p6c>
 <867bkw3zic.wl-maz@kernel.org>
 <e84587e5-904a-4cd1-bbc1-408a674ec1d2@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e84587e5-904a-4cd1-bbc1-408a674ec1d2@leemhuis.info>
X-Proofpoint-ORIG-GUID: ZrEKsAvsB2GoV4I65AsKU2ugdpecKRiF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NSBTYWx0ZWRfX8UHfRhJav86U
 QK81ZWdxiVohMS9XgVJE+8fW4ryGjzTYpLjyxMVrnckDfFfsbO7t5lbAHg2XdaiARzTJ3qmDAF3
 WS8l1rkEqERUmXGehb8U5C/IFCW4h+U=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa93e1a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lmjIgOJzRCt-5ZhLMtQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NSBTYWx0ZWRfX64+PCi3lFfzC
 MHtrK8tVcZx5q+DzCU8XwsSUSaIrtdVJTtcBhd3eBSGZvVGQ/ew0+YKCQIDbqDkemqUMWSj+UxZ
 Pc/Ktk5v8qw9R5LrUPmM3ZivO8kD26c9WYvI2FYXC1l7aWjkEzR0j7Psw9hu+4WyXMDv4r1bY6l
 VD+6OwkkdMSHGWTPtp53tsoFcU5/KYX2A6XV7TccYndIvCYSSDjUC4quXRutuMD0lpRA17PZYx+
 yiFgv8HFCHXV7lYdehyoda1eJWxJmnbKzWwXPdFui+lRP2ndM3jn8S9o0HOKf8Rjiu42Os/PY7f
 Akh5B97jJsXhuo2FatUEUP1pV5g5g9VgnkUBc125060KKl3mCftGCdnEZVca5Y13NXIEOWXT9Pr
 uYi7hvoC7CkLIXrAgvLtMd/iEgrBAhwWWq2epnH1HZt1GEUg7wJYfP2JQ9XafWCN8GnO+wEtNor
 SLhePHWbx9anJ1Vmbkg==
X-Proofpoint-GUID: ZrEKsAvsB2GoV4I65AsKU2ugdpecKRiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_054619_639328_98DEEEFC 
X-CRM114-Status: GOOD (  26.38  )
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

On 26-09-15 14:12:30, Thorsten Leemhuis wrote:
> On 9/8/26 10:42, Marc Zyngier wrote:
> > On Tue, 08 Sep 2026 08:34:18 +0100,
> > Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >> On 26-09-07 22:15:09, Marc Zyngier wrote:
> >>> On Mon, 07 Sep 2026 21:21:44 +0100,
> >>> Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >>>> On 26-09-07 18:17:29, Marc Zyngier wrote:
> >>>>> Recent addition of QoS configuration to the X1 variants resulted in
> >>>>> systems that spontaneously reset at boot time or under load.
> >>>>>
> >>>>> Given that this is both very unpleasant and hard to debug, give the
> >>>>> affected user the option to survive such event with a module parameter.
> >>>>>
> >>>>> Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
> >>>>> offending QoS setup.
> >>>>
> >>>> Lets not start doing this, please.
> >>>>
> >>>> Can we figure out which platform deosn't work and then maybe we can 
> >>>> add a quirk in DT per platform?
> >>>
> >>> We have at least 3 machines that are dysfunctional since [1] was
> >>> merged (mini-x, sp12 and devkit). Probably some more, but I'm not
> >>> going to be the one doing a survey.
> >>>
> >>> What really should happen is [1] to be reversed until QC figures out a
> >>> set of parameters that actually works, instead of making this platform
> >>> even more unreliable than it already is.
> >>
> >> I'd rather have the patch reverted than adding a module parameter which
> >> users might not know about and distros will probably never addopt.
> >>>
> >>> Just like [2] should have been reverted.
> >>>
> >>> Until then, we'll have to paper over this stuff.
> >>
> >> But a module parameter complicates things rather than just papering over.
> >>
> >> I suggest we get both reverted if they break existing platforms.
> > 
> > We're in violent agreement.
> Did anyone submit those reverts? Doesn't look like it from what I see.
> Do we maybe need to poke the subsystem maintainers?

Sent the revert for the interconnect driver commit only.

https://lore.kernel.org/all/20260915-icc-qcom-x1e80100-revert-qos-enabling-v1-1-cc4ba943bd9d@oss.qualcomm.com/

