Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91E7606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 06:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jCuviYeR;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=hML8/8//
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kn14ZXxDAPnsi1D1MdxQ+eGeMfE5jnb56rEFJ8sn5og=; b=jCuviYeRGfhgkN8hqeqTdeq3yc
	U2QEbwczOSeclp8hZLTFJC7DkXlUQ7bnY5rMqwEOqbOMjNQpa6JSc3yB+vdRaWOvXVT4F4tEqC4gs
	jqzOlwi6RyJFeYQbf4G43OxsyxCS/ikK/if35DFEZ+YaucCxqQvAqt4GJ02Mt7O2LcMCBRet82BQi
	sry3rgzB+H/LFRWVY48WhTPWlNU8ZEEM/0D1nawgfu2G96hPWGqEDtN7QccixL+E8mdWVDyspisxW
	sC24AAaCO+eV2RdqYeoBnkctn9B4llXoyG66WQFwjcyZmvcD/vJGGWgZCiesCXVKX3j6A58J9X5Dq
	+ogJPzSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrso-00000000nc2-1oHc;
	Sun, 25 Oct 2026 06:39:06 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrsm-00000000nbh-0pxW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 06:39:05 +0000
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P6YQD1539422;
	Sat, 24 Oct 2026 23:38:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=kn14ZXxDAPnsi1D1MdxQ+eGeMfE5jnb56rEFJ
	8sn5og=; b=hML8/8//78BWV8Rz6gggLqj1CZEeqBmkFwsb/bXvDtDKjVonppAy1
	PwdMrVgMG1zw2mQnOSaD4nM356s1PNh/eiCJHaGYSpTcJ1LVGOloILwjoEjeBrnP
	HGcOibC7R295J5y4hXoTr9BjWDWSq7S5xM/GsISHcYKCfKXTzn0druz9WW3Cjq66
	eeaHbYoxF1KuhCGCjx53Rxv+BquLKRVOZdMXuE87NrE2wvbtqWHvs+Ht/hxNGkpC
	IawNBuYvu/xbEl2+8Xt1eGo3HxvcR/tYHTgQbVal3HKVKv0xzMUHcjvxEd1fMk5Q
	LZV5Lz/bWaUrc31RPZKnwbpmeAEA/1lHQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgtg6b944-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Oct 2026 23:38:49 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Sun, 25 Oct
 2026 06:38:48 +0000
From: Amir Ayupov <aaupov@fb.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
CC: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan
	<skhan@linuxfoundation.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] coresight: Add pmu_pulse/extout_pulse
Date: Sat, 24 Oct 2026 23:38:44 -0700
Message-ID: <20261025063846.3112301-1-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAMAsx6cvv6XZY=LdayuEvBAXV3NN09Ru0KCcdaufscCtMeXoJw@mail.gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Yd_X-BzwIRCLGK9SunHtx8tIog126Len
X-Proofpoint-ORIG-GUID: Yd_X-BzwIRCLGK9SunHtx8tIog126Len
X-Authority-Analysis: v=2.4 cv=OJqyTiaB c=1 sm=1 tr=0 ts=6adda3f9 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8
 a=rCbvo_beL2p0TiC3b8AA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX0M28iCrhYeNL
 uc2hUyommR07Lr0orWEssKAgCqjR1dYAY3sLIxqe0mxFupU1yroGy5empw+WMB8d//0+PmgmMuG
 1VouVi0Bo3NJQH1HgNdEPqU8l/l/svvMw9rukUadDBGjuPVyYPIgM6tTNGu4kxPQsCcnC4t4lMY
 sNYZY2+miIkMwBpDcud1g/L1NF2j5TdMsk8mpFrAjsNfsR7CWShX7fTwiIIIfWPvRg5uHgonIRe
 UVV4/s7RK5r7sS6MzmaDQHPGmm6K5gukqZM3VvPpf1w8NnVNJnpszcdnRspNbIq4sHmvYcPdtge
 kcgiVlGpfYWTPJNTTl6mD+0QqMnIZx2GOkKSrUs91Wrt82MPtuMDFuiGAm62vcIHYtHrANxO8Ll
 PJWD99wzcd+gJFg+szXQ5ZMpfeEQvT8eORx9M3u5cjA0xuRZJ6W4WWDIIUhusKb33kGlQ8y+UZX
 r9fbkzGzZ6E56/bZCKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX6vECQcFUaeU+
 lQnLvQeGZ6n+wP4Mv4lpYFAZ+FsnUBr421DLtA3x83dKaKGPQoLsul6YYk58ZH5+TB8a1UJ0wwS
 hFF8mGXtkHMajmo1kBqVot2RhGZKXuU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_233904_357947_37D76251 
X-CRM114-Status: GOOD (  13.36  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 12 Oct 2026 22:09:35 -0300 Daniel Pereira <danielmaraboo@gmail.com> wrote:

> On Mon, Oct 12, 2026 at 04:05:23PM -0700, Amir Ayupov wrote:
> [...]
> > +  perf record -T \
> > +    -e cs_etm/pmu_pulse,aux-action=start-paused,timestamp/u \
> > +    -e armv8_pmuv3_0/cpu_cycles,aux-action=resume,period=1050031/u \
> > +    -e armv8_pmuv3_0/trcextout1,aux-action=pause,period=1000,call-graph=fp/u \
> > +    -- ./workload
> 
> The CPU PMU name depends on the system: armv8_pmuv3_0 is what ACPI
> systems get, while on devicetree systems it comes from the compatible
> string, e.g. armv8_pmuv3 or armv8_cortex_a76. Maybe add a sentence
> after the example, along the lines of:
> 
>   The CPU PMU name depends on the system; the available PMUs are
>   listed under /sys/bus/event_source/devices/.
I'd rather drop PMU specifiers as this is not something this patch
series focuses on, and examples above avoid them too.
> 
> I applied the documentation hunks and built htmldocs, no new warnings.
> With or without the above, for the documentation part:
> 
> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
> 
> Thanks,
> Daniel

Sent using hkml (https://github.com/sjp38/hackermail)

