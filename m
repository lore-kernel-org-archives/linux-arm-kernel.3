Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b55hzJ/H;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=arEFb7bq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S/b4avnF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eaDHkc9G/I0MAe6m0voUWtzSygLUX4fM6x1I6ZOZ+m0=; b=b55hzJ/HkNy0Lb8QEEl7qXGZTi
	yHu9yu5VHes1MfPQQCWwEmpl88O/JcafAWl7NEzSN+fB7q43jrXsctn089SzqufeDbAF+yDtIBMNM
	nJ1SE48/wk40VBUgiq0JtqotpH2AC6ncsJT/v8GXsATA12zxxNcNS66o4pGxy/keXFJQe+hVR3t7g
	Jt7T6BNvayoVQ2fFwvTK9azksrjs+8VXEgn+aWEeDvL9GurqOTEKHOKoS1TPuLJpJik/9FWGYTxB7
	26cPx7UFwF+Wr1908PwKEsKSin6/cvCgsX4UEPYvJut95IMDK3elm+DFa9wVCXDLqO3nwGBrCSGHU
	r+U99irg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQKB-00000003AVB-1uBd;
	Mon, 26 Oct 2026 19:25:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQK9-00000003AUo-1n0U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:25:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIopeo4080963
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 19:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eaDHkc9G/I0MAe6m0voUWtzS
	ygLUX4fM6x1I6ZOZ+m0=; b=arEFb7bqzSn+1ft6dBD3V0Oqup+tgDCV93IqQZan
	BA+7g68BfxsOvo8g14TZZxQywWxXArLMcRoFmI57Ak5MXjanhiminaVz8ONem4WA
	zFqJAShqTPdMUE62U6FgMBZGRqhUhmyQC6ZPVFQUgcIR3v+0rEPxPnRjLwGMWPgJ
	C4pim3qbtRmjdo2V0bH/UcSfxEzElA0X/RHarnQZK/Pg6Jt1k1k28FMBxR/H5Tn3
	JPcysHTrTxMsxz5AL+FehYa0w4T1a2Udxr0VT1o4jHAWXI5j8WLnnSIXNmGqImhc
	lAi+tI+HPoNgvBkt2nth5IjnGzo1YdyTWCppYW0aKu6KJw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y223y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 19:25:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso6273077eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793042724; x=1793647524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eaDHkc9G/I0MAe6m0voUWtzSygLUX4fM6x1I6ZOZ+m0=;
        b=S/b4avnFkAHMK3GeHm7gageqQncPYNjzO8yIVGkvqk6+/yLnoIeJOpeqAboJcsKFGW
         ReqfUxFSUZ1MiZt9naNGEKiZNeBT2SO0OHwtxZVpiAWrNgeHmv7s3BqcsfEDN5HPAZP5
         4Cs7+3XQSJXJNFly3484lWdyQnBphwjKMJP+HxK7Y3LJxWAHG4hnkFwO13wViq4bWail
         teHPO6uP4y3bD20cUx7bq0/1/KPPnKBjdrnJOEeqXh2Bp5I5gC2QFUaDoH72wOOPaqKc
         /lryaftmfD/IfZxR2RBpsrgMWRq3o8yBTCkRE/bC+T81TWT5fiInnc+ZltCw2Crzxwdx
         3bAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042724; x=1793647524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eaDHkc9G/I0MAe6m0voUWtzSygLUX4fM6x1I6ZOZ+m0=;
        b=eYOAHwDyiJONsUDRlb9t+b6vWQr8lbwzNp/D2d68Mxv1Ww+Zlljua25BXDeFuKLyXO
         HCYTyLfYbSa4kHHpeUHGCk1oLG1Aj8MQW3LOFSb7Kz7c6raFypEcHs7+Ux+MOWlodhPL
         E3WnRCiltn3i/sA9Apa5ezlm3ORZ1sRLxieu2urQXqdSmWTsfjCxhBQdTyxfAlZI1DWp
         zYWC/QypWQ7hcm8q4+qpNK4yiLP8UO6RobRIB2Z8Yzvuwey8RAXrj3ywlIgZkKgT2/L3
         RMuQki8iyXl/SZzGmAHaCz3dXcgvNqSIuJwRLTwldhI1jzAawMjYjqxqG6TFESJykEVM
         MLcw==
X-Gm-Message-State: AFq9FYJdkUHlrJxm3SDINlbvgSrMOiw/nk3EJsqY3XcrZj8lAvbhN4ZD
	sV2OmXtWFG2gmEl3mR/Xjfim2kgahPEWZejU8EYJc02WugZoYwEZrYUie14nqrDmEnnp6xmvH1W
	EYVd+ruNSjOU7RLhpINnZNYZaN6bF34fTy6VuUvtmWEbLZPKyzXmwDcZ+MEX3RuB0MIPhL+6Ikz
	F0+A==
X-Gm-Gg: AYBFou1QBQGy8O66rUqwXBbbSmpdokSewrIcAQAlwy8C8buPpFLqIb5hqcsb9j6aBxE
	3+Pw3uetFHh7GD6vRvCwpYOxcnKYEhEBg8br9myVDcOn5UpmLtnZNjcSfHzSoaS5/xOwNsq44Qg
	54Q3uvdwRhDce9C62AmzmmsUUPAxzi+5KhDB5utobKPqRFKC95DVjUEKMY6WezRYfoxFyPbpG/A
	8DyY4JTSRg5LAH9qZWdVySUERysTU8XAeYR90jt392EX0vrPs8NX5bfesDcUhP+bs0sj+pMq/LZ
	F/jUz22qrcBEQACe2nVwwdxLmBHazrlpYcFEHu/bn2inl/7DeGwHDIcH+EuTaoDsmhvjTGOmN8v
	f/brB1ujhO01X07r+4Gb0XwXJhc5nLo82Ukk78H7e3HV9+JjSHx9U82Ylfkmk7ucoBGnIgDyAIT
	IzUWowItb5D/Q69IbnnNOUEw==
X-Received: by 2002:a05:701b:4211:20b0:144:c123:4036 with SMTP id a92af1059eb24-19937307397mr10845367c88.35.1793042724286;
        Mon, 26 Oct 2026 12:25:24 -0700 (PDT)
X-Received: by 2002:a05:701b:4211:20b0:144:c123:4036 with SMTP id a92af1059eb24-19937307397mr10845331c88.35.1793042723659;
        Mon, 26 Oct 2026 12:25:23 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm24128417c88.21.2026.10.26.12.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:25:23 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:25:21 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
        will@kernel.org, mark.rutland@arm.com, maz@kernel.org,
        lpieralisi@kernel.org, ruanjinjie@huawei.com, liaochang1@huawei.com,
        Ashok Raj <ashoraj@qti.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH 00/38] arm64: Add support for FEAT_NMI
Message-ID: <at-pIUZFm60hiVyQ@hu-ashoraj-lv.qualcomm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <atwyAKSnttnBpked@hu-ashoraj-lv.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atwyAKSnttnBpked@hu-ashoraj-lv.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA3NyBTYWx0ZWRfXyOkl7ZD5rGLj
 ZjvkPLVFabiX5CPc1dmbEOhkSS75G6xmzA6SCF8PMxZx2EeknReQ3OSGCCqGF4z5uQl34YCLcrz
 Onzo8SWWG0nX36G1yorm741uQ9XSp+M=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adfa925 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=yLKLN7fOTSLvfP9gS9EA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3NyBTYWx0ZWRfX712KYXJ5uLsn
 MPfcz759z6u80dZqxFjZCtUVRuKfsWACOCyEd3BJ5Yi0oyVmHYE/v6Obn+z0oUIheBTKC+oUgeC
 l6MWUFNknVr1FaKpb7U3sPKoGkyg5JriplVYyMdfKn59Blw/w9pPwsSIOpwqirUDTng8h9CAmPH
 dd4HEtyYXamtgscaeUPI23/86kIeG1cTyHw6neraG58gXsX4MpkwkXN3HbJ1Pde7T7VfPpPQ5k0
 sgGklQaMG3maVk0NsQ/K26qy5gywAFqFkm+SLZ9y9bpBy6b0RhELTrhW04Pf5GbXh2UtODyJBqk
 bwsXC+l/fMyDGD9jqY/5STh0RsmVJCy0Z3OdOVsW3H2KKcGyCnSndOquElYeIsxUfWiq0w131fz
 UMDH6c4ELm73h6jwT8uBzwzodbqFmiU31ggPsuE+FNICaw4IdWga23taPa4SYKxQ2evEhJBpU5w
 KX5XTf9ruzqqvZ4+3vw==
X-Proofpoint-GUID: oJ5mA-hz6MhQJObK0g4ITL3Y8MrOwqiA
X-Proofpoint-ORIG-GUID: oJ5mA-hz6MhQJObK0g4ITL3Y8MrOwqiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_122537_595661_88B6CB59 
X-CRM114-Status: GOOD (  20.36  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 09:20:16PM -0700, Ashok Raj wrote:
> On Mon, Sep 14, 2026 at 11:20:24AM +0100, Vladimir Murzin wrote:
> 
> > FEAT_NMI provides an architected mechanism for supporting non-maskable
> > interrupts (NMIs) and less-masked interrupts (LMIs).
> > 
> > Since we already support pseudo-NMIs via priority masking, introducing
> > another flavour of NMI on top of the existing infrastructure could
> > easily become messy, making the code harder to follow and reason
> > about.
> > 
> > To avoid that, this series first makes room for the new NMI "tenant"
> > by restructuring the existing exception masking logic (patches 01/38 -
> > 15/38)
> 
> 
> Hi all,
> 
> I am working on arm64 HEST/GHES Type-4 (NMI) support using FEAT_NMI
> and GIC NMI support.
> 
FYI: I have submitted a code-first proposal for the Type-4 HEST/GHES
changes.

I have some internal things to iron out to submit directly, thanks to
Jonathan for helping out in the review and upload the document.


https://github.com/tianocore/edk2/issues/13392

I have patches to work with this on top of the latest posted FEAT_NMI
series all tested on Qemu SBSA ref. Will post them in a bit.

Please help with the review. 

Thanks a ton!

Cheers,
Ashok

