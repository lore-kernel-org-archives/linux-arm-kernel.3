Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1151606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=02ZRscMa;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CR+jw9IK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GrZSqfgk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3jMmmstpkrevEgYUZTyeGz93R6TCogBufcXjsgslU68=; b=02ZRscMaanVaEVOFhpdVucou9X
	+w3FH6G9In8u7d7MeJDOaM8mUh24cidhwHN0OJAPS2ThZ1TIbFEeUsENlm/R7VS0JNawqsxBnH9xp
	iTwQFcNR0kl+hMK7n8zBlbPnqmmNhaHV14nKy17K4XF0QhDEOgWFkRgdtZcZ586Q7J+YHr1G/zb9K
	Pv/tpkdLzQfruh0LccrBbpnTuElaY0pSimZqfvrElutz4h8VVudDXQxJm1jsvIQw8XxS9zVx2cxYe
	BrUTg7piZgZES1JmcfKHWfiXNcFq+4ojXXPSZ+CwRpB+CjeWWJCPIrnaKhO+gj9Ua2+Zsp3TO1w2R
	7SF98Gfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNIh-00000008yTa-2z69;
	Thu, 29 Oct 2026 10:24:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNIf-00000008yS6-00uI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:24:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vUAD179453
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3jMmmstpkrevEgYUZTyeGz93
	R6TCogBufcXjsgslU68=; b=CR+jw9IKD8EvIIAOhBteoElscKIOWIfZ5np7FCjz
	ZwGrfTXKkp/KbFTepG/F/6pbw2dCYuUTenFxBavW/t0UqbI4DPzgpU08ITwpHE9I
	vtRCkDk77kqubMta6GOEN7sj0JIe1cAakJSzlv6JvvRf6LMToswOlJIJFPspJTF+
	i0X8O2OJvXKaqDwfOuPo+LSvqmZ+VLmiJOkDQ67bLLR+vs9ZpNVeGUJsk/5uxrpl
	bwRK/b50n1tObp7F2uba2Ce7P1K0aDQfw178cYRtmSLSVBHKjDd/wDZbPPYHHA4P
	aZzUeP9WcI/jal/eiFFP5VqvmegsiosLFlCf91WfczXnGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc32y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:23:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so400932585a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269439; x=1793874239; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jMmmstpkrevEgYUZTyeGz93R6TCogBufcXjsgslU68=;
        b=GrZSqfgkahDwaNX9v6r0DdkFzVWq+QmVuABPuj8kgb9Qxw5iylHnHPhmI4Muok9QL0
         YmIVr5fCUVsxzoi9jWVxYu88daVWWiZtSGstZxmFaWIjh5cIqROoh31j6+dIs7WDHce/
         PcshlrxCI3Ez6CvMq9OGfxkPN1kba4meMAwUA1J9Za9+f+fE8WRSQYBwj0h7aXwujOkS
         G+YtNYIX1rpa6vR8ZFrWTogZrba/dO3t2F5V1xqFD9GbzJj5wgfAngBqsQX5X0UY8fOY
         XPOVwZ9g/JGTt7GRXUGQM3cMgYzoFNwnTf5zPu3Om78peH71b2TdcT6HTBe7nTx+guhw
         6b9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269439; x=1793874239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jMmmstpkrevEgYUZTyeGz93R6TCogBufcXjsgslU68=;
        b=t+bzJGhvanxUHlkL22Ysdm2SnYr1ldtW9jE1+DcsnFLkknoNxH/ngb4exgAtFSpW5w
         LpPKGVW63sm0D3yzBG1w+BLIcWbWgn4XYhFxPLF3ekaCvNcDSpw4vaQbAoV0XVuyIF1V
         FkGmt7hSoO1LsPkDoYw1kWN48/+laQSJ0bN0rh75MrKApIEHvEfJTly0h+jOB6Zr0Qjt
         leKaiX4tZdfHoTb/H1ZSc4eD5Wa9xptOiWr2CQOWqZFDuBig+bNj0+Y+Vj4UajOseP2f
         ytiZIAc7RrJQ/Rc0eDR1MCp/52rJaHdPjSq/cuWl37wD70F/IjpA9QtpLCcEbn5QecEg
         1dXg==
X-Forwarded-Encrypted: i=1; AKwUvBwj6+EG82C761Wer3jqRxibe15X+Nlflg85UqixUg7zqaeBmoFOkJj5zzMPOqEhjcLJIhDPUGgx2R2gCUnCDuxG@lists.infradead.org
X-Gm-Message-State: AFq9FYLCX5KlxilsSqa+9y2IMHV9D8Oi5spsf1umYmMigKEMbPkPCSR5
	Z6leyVCceYNytpN+P7/uz/+8rD3aY/AZQjHpiGl6+aWpZcA5PKlyE4ElR+H14doG35fIJSq0Bl+
	G/YDE8gzD9qyM/+2WjzuZ2oUa8s4KkYj/E9tFYrptB+r/ax5R0wLH1OSr6cUthLoPTAktrowG6A
	iNww==
X-Gm-Gg: AYBFou0AbWi3fEgXMtCGnxxSSj/dyhvDtu6IQ+T2E0Fs1509+IBgvjObhbyCqLQvqCS
	NjtyutOVMD5jDVrMNIiRDspoVDsye/EBkjGF8oP2HE4pKWhnlfxIlRlT0NUtl0EIHmr621savVi
	0DRYz4d28QrOd4oL5JqQaErrFIDx+FseaJR1BrxOpf/GqiHRSpsCnS+EvtPNbK5u9HkRLEeQpRQ
	wcjopmxFkXb9XzCwQnKhcOu6TXLFUJSB1b2Ah5qcOYE63uk3SY2gvXzyAea0wJHl/X3iR/MULHv
	hEzYH9cEG8VvbEXmR4w7C/772ycaedVw0ui3m9LOpBikiL9pXKoYcFgAz3L1Z4bbXRA++29MKQP
	+Mt1s6Wzs0scrafnqwZbpfZDmZK4r9xMyxKj6UBa28+sK1ZJggA57Ic47EK9xmdsx
X-Received: by 2002:a05:620a:28d0:b0:93f:2b65:f47 with SMTP id af79cd13be357-94408cb5c69mr730111785a.25.1793269438936;
        Thu, 29 Oct 2026 03:23:58 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:93f:2b65:f47 with SMTP id af79cd13be357-94408cb5c69mr730109985a.25.1793269438371;
        Thu, 29 Oct 2026 03:23:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm12399755e9.12.2026.10.29.03.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:23:57 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:23:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Message-ID: <337wsyqgnma3l6xi3xarj3ed5wwxweuf45vq3k64igjgufszlj@gnb4zg3j27ml>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-8-fa4b3ff1359b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-8-fa4b3ff1359b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae31ebf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=shUxFSsEnBkLoNWfsCEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: QBzqsie6tqzIPK1OFXZcXJMNxgKEgQmF
X-Proofpoint-ORIG-GUID: QBzqsie6tqzIPK1OFXZcXJMNxgKEgQmF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX9wOPEkImruO8
 J2TkXSign+SJ2iS/xXuaVR7HkB+WMr9jYIRrAoL0mIZo8UTIutgWpDfz56PLGFMI31j7sOgm7nM
 oIDZltGaBKsQ6dNfJl8L5fg44z8ro3EzE1OzSWWi7T6YRMw7dzhCNP3a2VKPVX9tawDpN6td0XB
 dtgz2JO5bfRU7BMcxyjgKq2sWexsxUO9eDG2bpAjN70dXTTtGRroVYJkN68PMB64OqEML1xkcSa
 aKMrJ/3S0oTHfr4CwWGCix/zapyobcNhglT8Vqw75ZCZcI6bhaGZWEy/tmQ/Vzp//1Cwe9OiaLG
 QgcL3UnB8t6XziHrvKBnXLQJpYy6Uc0plZmH0gRtYAMOlFYMB+vRiJWNfqQjrLlaIwPjparS8Fu
 JkO1biVvc/5ODfHIhuJiN9IpPKHCtoAhQwPMLSHCqajx1J0tZbl3Sdg9xeYj/y4joIG7eL6L+Io
 6+igqRTSMrCdEsExeSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX7jzKigTVL/GJ
 YLIkGd0CUb1BaSKDZK2tprQn/UDO5b54H0rNKRDLBjZ+j3jGLtRjiGj42liDYte3nyiG+1x/FLo
 WHKvyLEneRsKPzkqyAbtIOO4YEjipiQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_032401_164480_50A7815D 
X-CRM114-Status: GOOD (  14.98  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-29 14:31:02, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
> lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
> qcs9100-ride-r3) for use by the psci-reboot-mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

