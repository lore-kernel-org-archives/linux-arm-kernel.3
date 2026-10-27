Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC55606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KAiHRgS9;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqtSX67V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QO8aNJNY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7CPyHB0PycX09hhRl0EtJfUyTlgtNRaedU8gXCm4IuE=; b=KAiHRgS9/a9Q+Lp0Iw2mg4W+Eq
	h/UPbNHD/y6j3XuFnJttzaGnRlarNU3fZTh3+3CKCDxD64/lsoaBWU+3uvHJSD+LlfQqIrn0DYOAC
	bxee3yRV8eIIhwRf7JGwBwBfLBofrdKKC/z9crgm8eLreqgVxh92fjhMY+1Qf1/pozUNyxQysSkqn
	DBsbmPOmLmgp1hJMa6J98qmOcEc4D5FytVVGzHSYuBiSFWzyiEDXQcQZkO/U7x71PmmUQnEZdYuYv
	54F1so9K6RufqlwUxtVf/wfPjGnQYyqa1xghQkr4wgI/JdnaBKXngV5A/AzEpk39UlGdSVmy5ILoq
	BXljkKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgyw-00000004kwG-3oUL;
	Tue, 27 Oct 2026 13:12:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgyj-00000004ksS-3eUj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:12:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeG6A1936213
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7CPyHB0PycX09hhRl0EtJf
	UyTlgtNRaedU8gXCm4IuE=; b=dqtSX67VOxPgfEiyDDPG3frfOnqYKsK6jplLSX
	urY3NnlFg4fAH3nQiEe/QGFAHqteb9SezZIF2c5caoM62aRaA4yVxL9YJtPM7B95
	r57tc+PkwubQWlsXyx56ZtUFkUddUi+PPryQXJm5nktHzh9ZXPm5x0X+YcfaIOPe
	Vtu1EfLL0lotWw/mnGsr3mcg+VFJccykpJj5f7cJ/7ShE8BPO0XrgRPSH9iec4tM
	o2X2ZMcgcbfjEuf6P7BLcRvtt07GomwPgnrH+SRRFC6HvNjcaLwFKfFOTDEhYsZS
	BDFoF897ELwV8YhHHVcBUiyKVq8XZO3exVfR5T2EGBYHtkOA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavu06c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:12:36 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0d978e4faso64721397b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106756; x=1793711556; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7CPyHB0PycX09hhRl0EtJfUyTlgtNRaedU8gXCm4IuE=;
        b=QO8aNJNYgI6g6tVa1yQZbsxIiYd3x2ki6EwNjUlZWiin1BYDEIE5DgoTM2jUYMmKgG
         Q7vJ1XFyNyJ59zM3uyiTMxtjRinKIcGF3yvotG1IlWQoJa4A2RWMcuwZOSqtYzHmDFdJ
         3BU8bmIMjG1q/Bp+NDUnjx+L0rRGaYUnEadBVVAmt207sQt7DBEFHXtNvcBiRAGAtHG6
         ouDsfX+3yTO5qtris2iV7Z8meGcKn0pD+tfC1Lkz6yHelCnr4Ct909CwtJvxh8A2nglP
         IZ+qq9pd0Rw75nGfT+5J4YDrS9oYZ4ACqGZDn8ClkDAEyMyWC4bVokf3FNsjoT+Gsl3n
         74gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106756; x=1793711556;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7CPyHB0PycX09hhRl0EtJfUyTlgtNRaedU8gXCm4IuE=;
        b=gYZOJ9IGzOJIw7XiH5vHj+MK50NghBHUx5ptMv8wPiZLaysT7F2Hu+2//FdrWJBrle
         5NKp6YCuNwh6y9qqSDMdDaovP5qY4Q25VGjaG755IVws5BorWDmwfxem9I0MT2m8BG2A
         nXTwywv7pHEg2rqmMYUHlLfZAGDhe/m33Ab9jDvbpaw1LjccuPYw1OE1l0nTD8T9RdR/
         qcF9D+NGYgbML+Cimduh+YJVeyIe4IZgsTI9O0adfZYxoghbEq/Wk+TF8SrgpCVasAgq
         MRdzDbHN2aa7mfC9+GtB6azClOgYZpHlnbuugYZIEkJQPCS7zuE09xSKmWJXMyeYoUOM
         dWzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdt+S7xe4xThd/NkxyRa5+MWXl4Tfptwywfbb4iXIF/JXRMlD1gsfvSUI14ofYQYDdSTd/8vKGsXE3cZSfnWX7@lists.infradead.org
X-Gm-Message-State: AFq9FYJJdL6WEZhrP3y7FWxLc1YZs37RD+k9rgKT/2CeOm7tmiwG9wZ+
	0jVqPJPzYEMacRaebOxqByXkZp+LXkj4TtjyrKKZBA/Bs0VfocJ8S2ypXtnExiR8EX2XCCvn0tJ
	fEhW1TvnbTfHW3zOnnazpBkNmNC2fhbA8RoB6mwYeLeAMcB0/dv4MBpITBIBCXyZaUnF4T1CzbX
	iZ4Q==
X-Gm-Gg: AYBFou2TRxM0Z9pTp+1Kf7nPkN0jYwU7/e+ekrP21HoCyXImduAXjt9LIpRLKCdTtrw
	ys/6MYOoL0gIKxXvsveVwz4Xowo2O29oYhJP9QyXW2H6nnYJa7uWXLaAEl4gjMO6netqC0Zq0jg
	m9oSOPnqq2hIOR/sfxZG3Y/dUQcf3FMiWzjqCkbtta08q0UJmrJktuJ0+93ernK+6Kkgnn52JTN
	7up+UvEQlME+ANBVRVXga0ejRZwRjX1BzmpfFk9jO0/rzzf8TahqU3IUHug/pOrFusSAnRRqDaJ
	KGgVMV8s/F5PnOkPrHpp8sFOEk5/frm8e5QhzRxYzq4N2+tYHl1JV1oLlECqSklBmps7SoZc81O
	VKDT9wsE6Rf1YOu598aZmLiluTr9Q
X-Received: by 2002:a05:690c:34c6:b0:8ae:a9c6:2740 with SMTP id 00721157ae682-8b166c51804mr49998327b3.48.1793106755995;
        Tue, 27 Oct 2026 06:12:35 -0700 (PDT)
X-Received: by 2002:a05:690c:34c6:b0:8ae:a9c6:2740 with SMTP id 00721157ae682-8b166c51804mr49998167b3.48.1793106755356;
        Tue, 27 Oct 2026 06:12:35 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5ea7b9sm10743547b3.32.2026.10.27.06.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:12:35 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add fallback method to handle RPM notification in
 MPM driver
Date: Tue, 27 Oct 2026 18:41:08 +0530
Message-Id: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOyi4GoC/3XNyQ6CMBQF0F8hXVvSgaG68j+MIR2lESi22GgI/
 27BxJVsXnJvcs+bQdDe6gBO2Qy8jjZYN6RADxmQLR9uGlqVMiCIVKjCNRQFDK29e950Y99wpey
 UJrDgRyEZEdxoDdJ49NrY1wZfrim3NkzOv7c/Ea/tl6wx3SMjhghSxUqmDJFCmLMLIX88eSdd3
 +fpgFWO5KdhhMtdjSSNy9pgjlRZUfZHW5blA6AQbLQRAQAA
X-Change-ID: 20260617-b4-shikra_lpm_addition-4a9bc82bafee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793106749; l=3131;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=dVjgtspMHCfwvvtmrSjG/EOepUcFqgdmazLjIBANgoA=;
 b=y94OO4abN6gpgnWCw4Zq9jfs820vIQuUECd0oY9D+Gp69WkEXrz7LytSRldQWzTV5qgWqKa5C
 qgX8fz/A8XXBiEEj8jWhhy0Zi+JFaFhTIwRCYV/w1u2iyNc36fuuOhA
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: L0XVl2CN85iszjOmRmkNzyiUeufL_afT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX1h/VdDGpdbK9
 fnqqwr0C/tzH/i94/GEooLe0/umduKL0RCMpT+j5XGiSCPOPhsI31LlyabC6n7QHs/EPsv4ERhq
 wjwtse3dzhyLNyFs9Yd57LxxbzW2PMs=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae0a344 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: L0XVl2CN85iszjOmRmkNzyiUeufL_afT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX0GuJTk9uTdNo
 BxUX4SWan5KohpkB3PZbylPXbvMVRf0hB8X7S2Y/Qj51onI/drmXsP4t9lnf+iNAbNX4tEvPzIk
 QiSiCSy4oJtGm1nxrUBqEKNm9pTT49kQ4mkYxtWaCeg+TtvnSxa4cgkSJ3Vfxsdm8SO8F7ueOR+
 ZaA7BdRC8zndSzJHL1HgS7pa2n5CAknf2oUo7pvmTEVROcbfMz4qd52EpyZiovQKCWNOdh6Wifc
 VyhHdB9s+LbgbTVuUkC/ivdTBX0q0PA/y9d2tqvjtOwl97eOXPwxpW2qhVF5SRB12LLaMwg0d/v
 m1/0RLhSLNW1ehnctXKMVb5TPP0oC9SZJv/Kf9Tb00JOuf0JvQPKKlHK1GchSh2AzVLrI4j0WtR
 DWF4KorD2LfdmWEF0ATHuTdW/HiGOx8J/yUTQTVI4A1xqJp550J5Lx4tiAsSuhEApXbPJ82tKW7
 uLFEySCLsj6IKhQR7EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_061238_050463_E5F48238 
X-CRM114-Status: GOOD (  17.52  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

Add idle states for CPUs and CPU cluster for Shikra.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v3:
- Skip timer programming for now till we add support to register MPM
  under CPU cluster power domain without blocking its idle states.
- Skip modifying DTs other than Shikra to prioritize Shikra LPM
  enablement.
- Move genPD/cpu_pm registration after mbox_request_channel().
- Link to v2: https://lore.kernel.org/r/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com

Changes in v2:
- Enable Shikra LPMs in the first patch, following patches concern
  MPM driver.
- Register with cpu_pm as a fallback to manage RPM notification.
- Move USECS_TO_CYCLES and xloops_to_cycles to common header delay.h.
- Reformat qcom_mpm_offset() as per feedback.
- Avoid deleting cluster_pd node in qrb2210-rb1.dts.
- Link to v1: https://lore.kernel.org/r/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com

---
Sneh Mankad (2):
      irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification
      arm64: dts: qcom: shikra: Add CPU idle states

 arch/arm64/boot/dts/qcom/shikra.dtsi |  93 ++++++++++++++++++++++++++++++-
 drivers/irqchip/irq-qcom-mpm.c       | 104 ++++++++++++++++++++++++++---------
 2 files changed, 170 insertions(+), 27 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


