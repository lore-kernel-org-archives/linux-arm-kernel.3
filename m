Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EA4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=daF5NKeM;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MNDFmSaO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1jgnDUW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6c7FsVt+6kZf0MJjLIZNdKyh8QTMehkeel45ASz2OUw=; b=daF5NKeMFgBkDR
	tTeUCEuTxQeGrCT0pxtKOMa0s5VUOHq3T8b+ODwjp1huvInhiwKpusCTxRqZKfjwmavqP+D7GREeK
	7lK9GKZ6PLqfrkgVbBvCSjMtU/wTBafiOpEicIaacTZjmsgjS/0je4cVqJSgfSmHSeQnJXN3F/v05
	zIuKAh0FWebEpYH+g/Nyl6EQo6fnaFLc+HSUJ2RIjxDLDpXxguVp9qHKqGfAOxLtraa0R4RjoHQg7
	lFxAKNk+7r3WNuPH37xRYvWvqw4FMoCHTQBr0g8dIfpuYn4+FZu1g8gP57+TX9v7d2XY0hspZVqK4
	0lp9FunT/T/XWDAk0gzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM18-00000008muH-1U7r;
	Thu, 29 Oct 2026 09:01:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM13-00000008mra-3prG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:01:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vV3D179469
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6c7FsVt+6kZf0MJjLIZNdKyh8QTMehkeel45ASz2OUw=; b=MNDFmSaO7kMlN26q
	oGHHdpOH/8YkKDkEUCUHy2eDbpjLstGJv/1WYWpqXsHZiV8rFP96J6Qk5VCjJlAu
	9jyOr7U509jGuOhfMOLQCkkLA8EETdp5/o04X9Sl6FPIIA7iFDj4pEMekZWk3g9P
	nUoC5tuGbmcBJqh0+9IZQSt3pAzKeB0vdNNJT5WO6CERo1iZnlIwcKzCIwTCmCAJ
	tqyi35h77KZ9jbouMZZ8gbc2jkoTFbDjvJMVpR0MjL156qC/2/TTb/B2Aji0Q58p
	1LJboJCdmg/WGKX5JUsWELKM7NlH1l3eq69n6P2O13yL0W8CHj5DAITSKGzAVu2p
	g6Jm/w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2rjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:01:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso1901482a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264503; x=1793869303; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6c7FsVt+6kZf0MJjLIZNdKyh8QTMehkeel45ASz2OUw=;
        b=L1jgnDUWE+p1I4z7RP3pE6mUSgQe+DrcoBgkIbe4Exf24VQB7zq03M2Svsxj9e/Uwo
         i3CoRKxe3bEayp423HVNsXyLw8oGvuLSsXNR4QBJaZTTAsu4xwb+FmZhUJnMNw3x0R/e
         2QYRI8ZVBMkt8BfNloZNdc6TwgUScJzHhsh2Q7D0mZoao9JEG8nnVVw125XhF3jolIw0
         I2FvVGcDZ2+jL6ep9e7IPPRRWRZHna+6k9xL/KiFkMHaQLuUWxpVsg70A0cWzgsv7jEM
         IRsbzwmsTgPeQ4eRQBAeX7J4+rNUSsRfv7zNS5PG3e4O2bMa2Vl9/rlIW6+Z5x9i0x9z
         ir8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264503; x=1793869303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6c7FsVt+6kZf0MJjLIZNdKyh8QTMehkeel45ASz2OUw=;
        b=2I1k7mwiGZkEU1UtpepvC2kcTD7CwCY+/cokgZugAh8Ab2wynm0zGYH0VOKdt8UNP4
         yp3Vs73I/FcQhewA3jWk5qybyRRdM8Pxc2hCr5ivkcIJc8T8rILI48Agdb402D2weP/j
         f7BydcVKi7lbgYgibLwqP+kAOUDeB1msWDOKNg6uCP8DtstXP71c+jY8XiXMZe8whqu8
         Ucufn6czZGhyTjUh/uveZSE9blzsQi88JAhBgFIWn72nVMGdmLRBWqZAPb/cMQGLlyOF
         mOKR7N7blofLkS7qYmPfsEKSJY4irl5gd+Z6Dam5cr08RktywjauJ4blP0VOSCBbnaAm
         PYWw==
X-Forwarded-Encrypted: i=1; AKwUvBzNP+cm3yv8WlltLBy3txy2NkbUq78W1E0sCmo1BHq0VBNhEwhiyonmiahoEfTq+ZTHgU7nQOI9VtPk7rA5u5LZ@lists.infradead.org
X-Gm-Message-State: AFq9FYIAYPEpvYg+JNTNW115cHQH5E8GsTWjvDSYskFPILxVovHj8xYe
	9OVj30lrf96BjHlnWEOoXJerdQhlQXXDf1nwnPt6wttQHwCvHHdRRpqPWbKuf/H3b1vfInPXBGb
	NLDRF19h7yQ+w5SpyG35hCzoHrOiQHfbNi7t5nj6/+kQlVq6ti4pO6XK1kX+VQJv+bp6BRccfrX
	H07g==
X-Gm-Gg: AYBFou14nBbgagRiXknQPqL6tBVKDFwKw+6+56HP5rd9hCr5+uXNW2x5e7o3ZD7ZGh2
	cuPLi0K7GPopBoVh+wvr/ONrdZyFmcyGMm6AuH6VZusVKgRUz1+D3YFY2T7qVmY+57z5JWDM6fp
	wzf0skEkHDFpNE1u/Bq1HpY5yewIEAkr2qvUHDRmQlwEVJ8kvEU15023VwiomfYae3mIwSxLi7t
	Z0WygMcX95GEkZwcNScg3NIiTE8pwnw6gDWPcgl60IIESBIz5Y46ELByVR0iPUS4llcm859Hd1D
	zk/g31FWL8WOyq9/LxVqN+TgWYmZMRYvQJgqkoGZsEq1vOurSHODr3zW4EW4my0e6HbW6VhgzHg
	kGrTQWQadCoSbsHYdcX8Xrpi3cMyaKmL4zvGBO5LWE2jTI0i7JPzjynMD70kpUp/2Nj1NHlvtgG
	JBhmlJgDuM
X-Received: by 2002:a17:90b:2887:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3ae5822b129mr3774405a91.37.1793264502540;
        Thu, 29 Oct 2026 02:01:42 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3ae5822b129mr3774366a91.37.1793264501941;
        Thu, 29 Oct 2026 02:01:41 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:01:41 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:30:57 +0530
Subject: [PATCH v27 03/10] firmware: psci: Introduce command-based resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-3-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=8099;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ePR4OuoTlUavycOVnXKN78dPp96WxpPQP3RUTs/YnxU=;
 b=rFbPZmpQdrMFitTL60GQw2xS43zXmLQ65T6z/ZnbKBnAtM55nRiTudK9MHSlNoVNTfO7347Q9
 JKX0IJKBKb8B91rmnZlD4+DVdl3qs/YajGXshizrLE+unwyBdyA70QU
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae30b78 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=njxsUegImOJjkw56WvUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 2IXfmT3UNCpI2PXflontOvFxoqYqvOP5
X-Proofpoint-ORIG-GUID: 2IXfmT3UNCpI2PXflontOvFxoqYqvOP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX9Vha7UO9lLGR
 K9RgJvpSD0IR9fpNPhv3heNhFwKYXOSpx6T40wFTGb7qcAiIbV56LXxaqNzCCq0hOxQZcHQyF/d
 9QP0F57AXmCFMOxvRJX/8gTjAj/pgwtfw9Vi526ZKgZ6Uu6eGMLRDb/zg8p0A7wr5noBBk32PDP
 L8fZ60kgEc5NLxRZyiZKyRb3SlWFbwA2knhaqS7tzZJFVZqjNkoLAtauY+N6WI49EGS5vx//uYj
 bQbGajpOfBtK70FGMDq3W5qmoAAty1aMgEGX/xXFNliGfmVfrdQW1UheZFOBp0Caj3/dqFtHkp5
 EXajLyz6iRdR6pOf/Dh6AwTwoAsfGTFsDWyKjL8H9zo2mywaIOhCPpcve+mDUIfI/0uRNjBfW7n
 sko7nEGeiVnU2mumUMoMSSm0Jsq5WvWtidzY7o3+JQR+Iwzs3xe1IWngLZI7PT79Si0jQ8kDJ5z
 bAj0QqCB9KB+VfR6A4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX6K1s+JcDfuxR
 BbASfPbfZJeMQZUakFCasHSsgEF2w6E80Y5H7Gkt+yZJL2D/+XKz+wb4cpiwj/3EW9TzZbm25Rj
 NOlpmgtwpV89NhPte+MWqFaivG0asrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_020146_242938_9967FB81 
X-CRM114-Status: GOOD (  29.15  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
ARCH WARM reset. The reset patch is selected based on the Linux
reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
for vendor-specific resets but there's no mechanism to issue these
through psci_sys_reset().

Add a command-based reset mechanism that allows reboot-mode drivers to set
the PSCI reset command by passing a reset_type and a cookie.

Add support for the following reset commands:
  - SYSTEM_RESET2 vendor-specific resets.
  - SYSTEM_RESET2 ARCH WARM reset and SYSTEM_RESET (reset_type = 0 and
    cookie one of psci_standard_resets).
Unsupported commands fall back to the regular PSCI reset path.

Default to the existing reboot_mode-based reset flow unless a reset
command is configured. If a kernel panic() or a emergency_restart()
occurs after a reset command is set but before the final PSCI reset is
issued, ignore the reset command and follow the normal reboot_mode-based
reset path.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 117 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/psci.h         |  15 ++++++
 2 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..d489ba5d147c 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -11,17 +11,22 @@
 #include <linux/cpuidle.h>
 #include <linux/debugfs.h>
 #include <linux/errno.h>
+#include <linux/kconfig.h>
 #include <linux/linkage.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/panic.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
 #include <linux/reboot.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
+#include <linux/wordpart.h>
 
 #include <uapi/linux/psci.h>
 
+#include <asm/barrier.h>
 #include <asm/cpuidle.h>
 #include <asm/cputype.h>
 #include <asm/hypervisor.h>
@@ -51,6 +56,15 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+struct psci_system_reset_cmd {
+	u32 reset_type;
+	u64 cookie;
+};
+
+static struct psci_system_reset_cmd reset_cmd_data;
+static struct psci_system_reset_cmd *reset_cmd;
+static DEFINE_MUTEX(reset_cmd_mutex);
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -80,6 +94,64 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
 
+static u32 psci_get_sys_reset_fn(const struct psci_system_reset_cmd *cmd)
+{
+	switch (cmd->cookie) {
+	case PSCI_SYSTEM_RESET2_ARCH_WARM_RESET:
+		if (psci_system_reset2_supported)
+			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
+		return 0;
+	case PSCI_SYSTEM_RESET_COLD_RESET:
+		return PSCI_0_2_FN_SYSTEM_RESET;
+	default:
+		return 0;
+	}
+}
+
+/**
+ * psci_set_reset_cmd() - Configure the PSCI reset command
+ * @reset_type: PSCI SYSTEM_RESET2 reset_type, or 0 for a standard reset selector
+ * @cookie: Vendor-defined SYSTEM_RESET2 cookie, or a value from
+ *	    enum psci_standard_resets when @reset_type is 0
+ *
+ * For vendor-specific SYSTEM_RESET2 resets, @reset_type and @cookie
+ * must contain platform-defined values.
+ *
+ * For standard resets, @reset_type must be 0 and @cookie must be a
+ * value from enum psci_standard_resets.
+ *
+ * The reset command may be configured only once per boot cycle.
+ */
+int psci_set_reset_cmd(u32 reset_type, u64 cookie)
+{
+	if (!reset_type && !cookie)
+		return -EINVAL;
+
+	if (!IS_ENABLED(CONFIG_64BIT) && upper_32_bits(cookie))
+		return -EINVAL;
+
+	scoped_guard(mutex, &reset_cmd_mutex) {
+		if (reset_cmd)
+			return -EBUSY;
+
+		reset_cmd_data.reset_type = reset_type;
+		reset_cmd_data.cookie = cookie;
+		/*
+		 * Publish the command only after both fields are fully initialized.
+		 * Readers run from the atomic restart notifier path and must not block.
+		 */
+		smp_store_release(&reset_cmd, &reset_cmd_data);
+	}
+
+	return 0;
+}
+
+bool psci_has_system_reset2_support(void)
+{
+	return psci_system_reset2_supported;
+}
+EXPORT_SYMBOL_NS_GPL(psci_has_system_reset2_support, "PSCI");
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -306,8 +378,25 @@ static int get_set_conduit_method(const struct device_node *np)
 	return 0;
 }
 
-static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
-			  void *data)
+static void psci_handle_reset_cmd(const struct psci_system_reset_cmd *cmd)
+{
+	u32 psci_sys_reset_fn;
+
+	/* PSCI_1_1_RESET_TYPE_VENDOR_START identifies vendor reset types. */
+	if ((cmd->reset_type & PSCI_1_1_RESET_TYPE_VENDOR_START) &&
+	    psci_system_reset2_supported) {
+		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
+			       cmd->reset_type, cmd->cookie, 0);
+	} else {
+		/* Retrieve the psci reset function from reset_cmd */
+		psci_sys_reset_fn = psci_get_sys_reset_fn(cmd);
+		if (!cmd->reset_type && psci_sys_reset_fn)
+			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
+	}
+}
+
+static void psci_handle_reboot_mode(void)
 {
 	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
@@ -320,6 +409,30 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
+}
+
+static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
+			  void *data)
+{
+	const struct psci_system_reset_cmd *cmd;
+
+	/* The function psci_handle_reboot_mode follows reboot_mode based
+	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
+	 *
+	 * The reset_cmd is configured at the reboot_notifier phase.
+	 * If panic() or emergency_restart() occurs between the reboot_notifier
+	 * and this final reset, skip command-based reset and let reboot_mode drive
+	 * the reset flow.
+	 *
+	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
+	 * calls to reset the device. If it returns, either the reset failed, or the
+	 * command was unsupported. Fallback to reboot_mode based reset flow.
+	 */
+	cmd = smp_load_acquire(&reset_cmd);
+	if (data && cmd && !panic_in_progress())
+		psci_handle_reset_cmd(cmd);
+
+	psci_handle_reboot_mode();
 
 	return NOTIFY_DONE;
 }
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc4..e81b1cdeca51 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -8,6 +8,7 @@
 #define __LINUX_PSCI_H
 
 #include <linux/arm-smccc.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/types.h>
 
@@ -21,6 +22,16 @@ bool psci_power_state_is_valid(u32 state);
 int psci_set_osi_mode(bool enable);
 bool psci_has_osi_support(void);
 
+/**
+ * enum psci_standard_resets - Standard reset selectors for PSCI reset
+ * @PSCI_SYSTEM_RESET_COLD_RESET: Standard SYSTEM_RESET command.
+ * @PSCI_SYSTEM_RESET2_ARCH_WARM_RESET: SYSTEM_RESET2 architectural warm reset.
+ */
+enum psci_standard_resets {
+	PSCI_SYSTEM_RESET_COLD_RESET = 1,
+	PSCI_SYSTEM_RESET2_ARCH_WARM_RESET,
+};
+
 struct psci_operations {
 	u32 (*get_version)(void);
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
@@ -45,8 +56,12 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+int psci_set_reset_cmd(u32 reset_type, u64 cookie);
+bool psci_has_system_reset2_support(void);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline int psci_set_reset_cmd(u32 reset_type, u64 cookie) { return -EOPNOTSUPP; }
+static inline bool psci_has_system_reset2_support(void) { return false; }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)

-- 
2.34.1


