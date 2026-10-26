Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5846B606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WBDI/jcU;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYx0/A4k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UaAnT/ub
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tkzUKEtCzO5UO08cgKt/7yCSBIWF6848XalWEGzU7IQ=; b=WBDI/jcURf3Wxw8pxFCJbsHnoy
	j5tN6CRRB6xvTNjHIWxaj/tee73Y/jXvCwnJs7jWnNatvnnDkKgC2P3xC8JaROkSx0Eu6mYN+HQs+
	8Tl/fQC7U0o/+/UQr+FhiPNgGcTMqvDSA9enCp31IYhRmxt5zdsPX4mb3koX+Z4CN4ylaz4+1uKxw
	S1NfhjQ/P0ppcmY3mjlUUzBatyw8qR2W5bMxKJuP3FK+QMuEYXgq0VTzNVRY0JnVj+jhsCKydbIae
	1/V82Im9IBX9LSPgcvFrvXdglygrXVpbb1b4CEkWt9AAYdCCbWRTHRR5/bqCU/YrIvswlIm/3rTkE
	3SSJV8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNzk-00000002w2l-1iBa;
	Mon, 26 Oct 2026 16:56:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNzh-00000002w1C-1m6i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:56:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvY9B3618541
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 16:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tkzUKEtCzO5UO08cgKt/7y
	CSBIWF6848XalWEGzU7IQ=; b=NYx0/A4k3qsNe3Mffzj3VBX2lUiIAky7sUTbjT
	uv/wWx3YTPp1DfaQTMCK1A7BNFaK5Q4/OoV2HimHrpK7qBUDx/Tb9mZbaNY/bwt2
	RDqU9M/rvzcsV25ImfS0IhPxIZVRvYvpFFooDv61JRnZBXiYp6qTD0vc13QzCYMN
	cQNltZbc4j9wDpHlBBolGytNN2uIVv9itG6SdyajUYKeKU1an9VIVWF0CoKMPExr
	ZofA8o6VDrP1bBYdqiddOr3M9Al6cx8kQ5zQATDlA8xnCD54Z09CwtOELr6wT0Ep
	85b26QsDfNuD7VcRFf+PvyKyZBtAJ9lnH9ztCXtGk+FotdJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xry9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 16:56:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so828821385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793033779; x=1793638579; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tkzUKEtCzO5UO08cgKt/7yCSBIWF6848XalWEGzU7IQ=;
        b=UaAnT/ub3DItlWAr8/+A0x/Mqjx5GP5TO20vWoEuvDYpfKdrOI5vqKStvWNuT/gcnZ
         dawvxk8f6/u2uz/Y28Mmvz74M1HTgHt+NRXCRog5swgMWlTdrhuk/O/W8c4aewqQWsTq
         eclvWgVjCic7ET5LE918iifH7dB+vojdf39sobK/UuJiM+IXxZNHgUdQ4159IEEoITtH
         C4OjcHSuGuZwTjcM8gT5yu26tocdd3qs6h2ED1BnT8FgvlNpRGUkxtJO4dtMynkkPRCX
         KS/zB1BNZOIvBmnw95NC4xlQKgsxe6BssyQNqRdWZXx74dLbDmN9zKmPKccb7McAXi3c
         4SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033779; x=1793638579;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tkzUKEtCzO5UO08cgKt/7yCSBIWF6848XalWEGzU7IQ=;
        b=l0avhDTxd/gU49syK0dgEr/QamQI1zOsHKQNaSZinJjdsx+Ykowg+q5akPtYFwmvG9
         FisazyvW6d6KUmI05EZEt7k1v8q5KJHMKyPWFxrMjNXVZ9ePQ7pylbn3zfTNC3/B/5OF
         +pXdYaK0iyXKOcUhM5WXzmPXTCUbheWNUXNaFQbJQXA++YpJ4JUBf8wX30DnCjSf2oJ0
         xWvVc1fluktRMACv0V24BNG4N2GgtJM67sWi6yn1xw7HlB2hP5Y/54kgozT2LFYPjWoF
         9Y264+TrpWzSJeGA0dWqLPMfFqd3kFBMj1ZpwSiPfliSGZM0p8P2hIRg2QyECRGDLecO
         9i4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzsDKFejBhDwwWLNbCSgcNK9Xg1rz3BvFPCZpm+d++tO2eWCu4uHDeoZbWm/nlclLBpj8ehR9ZEUGaLTnrVeL8@lists.infradead.org
X-Gm-Message-State: AFq9FYJGSFC3NUUqX47Xvl3BNtMRHT+CEXkHOWnfFXX6oJfptjTi221i
	ZFOxrS5XC3iwwswcxngdEEqWmllS0E2bppdqseWR3ujSBiNBTD8+iLJTNPWC4IT6Vs3nlvERen6
	4GmE+XWT/0xQKsheca2NI84o4jJBdC62f/zz3awuFp6CuSA50447o0PprVpO2Xyy44IywFFoOkY
	2gAA==
X-Gm-Gg: AYBFou2gifwpLiEDbEKawYAmmCT01QmBJoo9aj9SLyeRBZq9kRHOYxIvEjAyrYzmDbc
	7Nlo822bEGgOJp//prdgvT6qeTrk53bXcKDB1dzGIsgPmAU+dnvctDFZameuurqvmNnrqE6konf
	n6X7EUN4gM11TrprbDMvsx6/gjov96VExwvRooz5jyHxIV8hLlkOu3t5L4sY3uzbXCG7o1j1mcl
	VG4yWtyzxEyJ8lAVFp6zZDoWq7spX08r6YgEfCAwBjAJQ4dLkV5ztlvIT72JEEoRYGUFWbqW0il
	pez1Mr6MpgqwIDJ7Kf2TDQA9xRH6ZGOkaujX95GAMRcr5jonhHVZj5nPywLVg8IID+Hf5lv/PVu
	12JkaMAcWXWQ=
X-Received: by 2002:a05:620a:458a:b0:93e:5ef8:c794 with SMTP id af79cd13be357-940ef8f03dcmr1103927885a.38.1793033778633;
        Mon, 26 Oct 2026 09:56:18 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:93e:5ef8:c794 with SMTP id af79cd13be357-940ef8f03dcmr1103921985a.38.1793033777993;
        Mon, 26 Oct 2026 09:56:17 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm18697489f8f.18.2026.10.26.09.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:56:17 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v4 0/3] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
Date: Mon, 26 Oct 2026 17:55:55 +0100
Message-Id: <20261026-stmmac-est-fixes-v4-0-999dac4de44f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2LwQqDMBAFf0X27EKMRqW/Ih5Sfa17MC3ZIIL47
 116mMMwzEWKLFB6VBdlHKLySSZdXdGyxfQGy2pO3vm+MVjLvseFoYVfckK5aUMYsI7x6R3Z9s3
 4B7smSig03/cPxR5v3mcAAAA=
X-Change-ID: 20261026-stmmac-est-fixes-13557ed8ab20
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: qXn_9j64F9jM8S-H91GupEcncYaZOa1D
X-Proofpoint-GUID: qXn_9j64F9jM8S-H91GupEcncYaZOa1D
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf8633 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kOJWhj_ZTKYB6xKoLZoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX3dv+xnBz+84L
 /jxZvB0LjjSUIB6z7MP0c09iMVRBEs7Og5z8HZuWP8p6AYFqGGe4PKAq+yvKm91DqRASpRdspRk
 /91mJpZMa6FjUHpAomhCqF4ZCO6SshLQGBjPhN5H1t82XQVpVpBpaXrxd6lXodpS+3d/tT3LiJA
 QIuC6tcJGYdJmf8cUvF5s/xzcF/azSAnaa+yYgjggfIFFlS18TheK/RvUDWkvaUtPMaVgrYNMpL
 9Hu459ZVHXHxKtMXKPb4jzx0Wu9OO6OB71rLAZxaH0t3w9EKSeN/L3wn0VtEd3jjzFnE4EmFCyj
 41Jzn1Nc6UIt0EcPe58+Q4FJWJH/A+SZaaXK4tcnAPuG9iiKM7TKKpmC1SeQMKCnalXJSYcRJw4
 8tKKo6zmmBtLBAt/Mv2ofccox+9cU5V39+59v331jf+lQKSr417wTSxErPAxHKnkf8hXL3BRuDh
 02Z4yXx4Dg+Qi0UrzxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX9OptphF7yEa4
 BqSvg3/GdGKUfuLdOYJ3SbWkENhpRW59ERoyyTdUwHSTqvEPjhIVfuSzZ7NwhFGQQSvYqlvbdPY
 gF6KcxDHqiQoG1+EPrN93HKKN+nT8Vc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_095621_486660_8818B817 
X-CRM114-Status: GOOD (  11.56  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reconfigure MTL_EST registers after sw reset in __stmmac_open().
Remove priv->est->enable dependency in est_configure().
Initialize est_lock at probe time.

Changes in v4:
- Rebase on top of net main branch

Changes in v3:
- Guard priv->est.enable update using est_lock mutex.
- Embed stmmac_est in stmmac_priv struct.
- Rework locking in tc_taprio_configure().
- Fix possible divided by zero crash in tc_taprio_configure().
- Add missing reconfiguration during stmmac_resume().
- Honor ptp error code in __stmmac_open() and stmmac_resume().
- Link to v2: https://lore.kernel.org/r/20260829-stmmac-est-reapply-after-open-v2-1-5e5ccb185e92@oss.qualcomm.com

Changes in v2:
- Rename stmmac_est_reconfigure() in stmmac_setup_est().
- Rely on stmmac_setup_est() in tc_taprio_configure().
- Link to v1: https://lore.kernel.org/r/20260825-stmmac-est-reapply-after-open-v1-1-dfa80735e0a1@oss.qualcomm.com

---
Lorenzo Bianconi (3):
      net: stmmac: initialize est_lock at probe time
      net: stmmac: pass the desired EST enable state to est_configure()
      net: stmmac: re-apply taprio offload in __stmmac_open() and stmmac_resume()

 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  | 41 +++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  | 18 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 32 ++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 93 ++++++++++++++---------
 6 files changed, 131 insertions(+), 68 deletions(-)
---
base-commit: 6430fb7f1cc4e329e386521b7b208df443de92f2
change-id: 20261026-stmmac-est-fixes-13557ed8ab20

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


