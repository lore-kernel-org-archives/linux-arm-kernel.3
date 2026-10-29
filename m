Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F005A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PLk56p2X;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPyC5VYU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6l+Jjgu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=; b=PLk56p2XqwZrG35FMUwpBDK6Ci
	FE6RN+pdtu2SYGmiPbGU6XnEWHHWsgJMZnI7YKymax16SEFTRvxTEuK1f01IQXham1XU0i8oKfsk7
	XnmMDpvZ6SspQ4Jp03MSS4Gerej804Ys8XozaDs84RZJHf0Fs1kfHMHLc829btE3MNF8Q3cf2nweo
	w+sqQR5Q5gZkd/o/hJoD2oWM8mGdUhN7FWRUbjE5QvUJGBpDyHdY9YMgIHrsPtjcQ6pX39HnM6EFr
	gtRMB5iV2jSGFKx6XGvw5U4b9hXqWsQow+4E9FfA4OlhSGHSb7OcbGeMhVaBLfD4ZSuUbLsuK0lfw
	3QLuqpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNIu-00000008yYR-42CC;
	Thu, 29 Oct 2026 10:24:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNIr-00000008yXC-48iq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:24:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vPUr3766358
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LNrIEX2HLFZvWx0hb7/TeOZv
	8vO2qpCvpN+LqCQcSDk=; b=WPyC5VYUubHpQEMXJRE9GWJ4zuY3zgsVgzNb8E6s
	2QBuhmjbM/EwxQwjBIwlxBLTmcyjHDs0t0tj5gjrRlsZqze/e2zv9bBHjz5ShGR7
	76WiMTlgF9K+WCPlXMxch1M6wO2v9jJfHrMwsOOWR9x+8aZvX161iNZR0it5dGNS
	Kxizbnl6tsmkCpFawBuqr1OBezAsFhwELNfWSaSWdmIxTWUD2r+taCfqcJ6PZ6cM
	S1u5E56GL5O/2iEm80fPjTQvZu5bTCcf32sz7tT+cUfC2FrJNhHwmEOb8IGbqbBD
	kgjgO8ejkBGLLM4o3ixxeJIQ6vsYzt5h4W6eAuJPbwmkEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpu4fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:24:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so277309485a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269452; x=1793874252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
        b=X6l+JjguETOiqGOl5xieOPTAuxeklHXV623KWm6c9AAtL/67IpLvu4ZVtPhWArUsQW
         yLpmTDVacpwaO4DjkjFStbZEt6lAMnqC5F+BRtsqwA3x29Ed/uo3G8t34gwsMh2t/oXC
         3KHBisXlYUcwY+zgGDiJDdPKUOMAl2eD9TOACPD9/ufzCHveb/uqUkhYjXOo875KK3TF
         er6WwpfFyqmfZw25lQVme0sjRc3Bgxg1JK+tz0lOnRGp/Yay/creT8zRhJjeY9Vvo1iD
         waXAro6ZCdH9bvhSnX+fDsPW3dBkSmj4i+pUPBqTDH7sSgGXSxohsWw1TKWkmEh7REiF
         iJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269452; x=1793874252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
        b=uezkr75Gg3kza7rYFaN/np5Ya3utecW4u+wUN9QlmWeUgtwcgE1beuEEonc9bRr+RZ
         dPmun6+VCwG95Ik7cqgu5GejlleSPDV+LwPbL9b4648sKiVkBzNucIMl/gKbKq+EO+Jd
         MBxmdWTVN5k3ruT+7JeXAHL9qgu+udLek/++DUytws4E3e1w5sP5/9O+HsM7qM66VtnA
         LELGyfSqcqE5ZO+b2FBr0+fUAGdvdfTHwOQVxYC7Za8WWUWVUYzwBYIvQcQf9U82hXzc
         FfIlDhmql4W1txL15Cl/5d03CpYg7Z7/BXHe2NTdtePDCWm9urLwcofNQfabCmM343oQ
         2dbg==
X-Forwarded-Encrypted: i=1; AKwUvBxHHEUiOtIS93o+sS4evK6F8U5l/RPtQNNwZC+CPwnKq45kLWKAfdy/PIMY1gOh38gzuHmh7lHOBhNkLDknyfue@lists.infradead.org
X-Gm-Message-State: AFq9FYJFuuvC1xgnULLhbJPjP32M3ffe4fcuzHRFpERU+7VtuaQeTBdG
	FWYQvvxEMfJycRiQa0KUQOe78JrJz7u7bTKDcRr0jbNzn0HOO2TF2wSEnvyILyWRjozpN8X/SOx
	btIToDGFEIODNYsfTJMsm1RBFQKgoGdMi7iHdh8sL+MW9sDinN/sTkfWYOimuRKsYkBsM90RHxC
	YEPg==
X-Gm-Gg: AYBFou2vJ0MUctcyVgaZlj9zbabsYh/2A6UwXPd07GFmxYNTiBBGMX6x3k2qKbIGC+G
	igWQUtMKP1fGqG9MemorbuM4v2IWI4loE0K1seWapeJzfV5KPwEdsvxpuQUqCtMGJPZ4Jt06FzB
	GdD/YnC5e1bn9fc4PyGHLm6k6fph0bicvG3S8AeAPqZkXXM8Fcwm3Gjb3Mvp4VQuY3pFToveFBU
	ybdkDf468VTr1gbuSF6GpAhrIrP3XS4HgQbK18VzUaRyVKseNOyd8B7TkfH3ClPYXjtHvfYjtO5
	652OzHM/m0C00Wn2Z2S4qL9wHbRxoKzuMHKOTVtwnOzikTVnk46L2r8bh2EtPP1SiSST2kLPSMB
	6wQ+K1LiZmkst09offl1mVRDklgb+DaCcoOBdDeohZm92uUje/cVjsg1Goto4n46I
X-Received: by 2002:a05:620a:3703:b0:93e:fc4e:c490 with SMTP id af79cd13be357-94408a6ab94mr766984485a.15.1793269452256;
        Thu, 29 Oct 2026 03:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3703:b0:93e:fc4e:c490 with SMTP id af79cd13be357-94408a6ab94mr766979685a.15.1793269451464;
        Thu, 29 Oct 2026 03:24:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm33789347f8f.25.2026.10.29.03.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:24:10 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:24:08 +0200
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
Subject: Re: [PATCH v27 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Message-ID: <f7rue5rri4gyfs3ltczakyonvejyubjbocwabpffez4wnjolf7@b2hnrwwp6mil>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-9-fa4b3ff1359b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-9-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX7W5N+Q4gxCu/
 W59qvGoQ7wKoNz4iu+HXNgfnJVnTh1DMYD5LZhFqZuPEh4ozogWmwqsDcda1PoNgaW5wBNDwVNo
 nHVLfyXRxdZ4+fPTKLqHAv9uz77uMuwqoGagql2C6hTIBayKVOG4s8FmqDHQP85unESnB4pPmVf
 irAo50Mhlk2gV4gXI8w43Ctq4A7UBTAVNyUxMlE+OJyr1aKk8jQWBhIr0XeRVsQiPsgUapVYxm9
 9jifxpCqUEWIzkVRW4Ha9bNJOTaAfS0Nq3tlHIkO+lxR1ziBiKRuoqIFqARPuu2vb/gv05o4Hgv
 wYk3GH/9vw2RjKuzJcNLE/QOPVNFDMcc6Xy5enuAKjGuEI5B8GMmwFS8j6TTOwiErqUUWUEIiwW
 mdi6ijmcZ4qRov4TBI03qnzmPSD7brv67w/dl46NlWSfasAdDBLYLJDAh9iuafvp4dxPxeUbGGt
 LvZ1loZe6ozkzYNWBQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX3LLB/q0lcrOL
 c2FXWWP69HVFFtPRQQHkkeSW3xRelkITM9ebOJ/n7jBur4flL28usvuJK6NCBUg2ezmfQ7Zpy/p
 BvYO7b+SMLBZkh2TIIBxteUFLEA9l20=
X-Proofpoint-ORIG-GUID: qXAQzb287VguBYTcNyEJ746_pwHOEQSK
X-Proofpoint-GUID: qXAQzb287VguBYTcNyEJ746_pwHOEQSK
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae31ecc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DZmtaFOGBJufDib-chMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_032414_141086_79ECFFC2 
X-CRM114-Status: GOOD (  14.80  )
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

On 26-10-29 14:31:03, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
> qcs8300-ride for use by the psci-reboot-mode driver.
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

