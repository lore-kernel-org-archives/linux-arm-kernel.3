Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BAD112585A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R40MiDjdV1CjralqS3R+Tb9SfFYBiqy6S1/fcSy9W5g=; b=BISaf1tZJGAKvwMFZqX5N8YrNO
	FtQKTJXuqUfqPWb3vR81d3uHrqnkIGgwDDX0mmg+r8jRk43V0vA+ns3aJkAzqgKKG12j54vi5raex
	tzyzISIR86XzhleYvtvTgOK5euE9omW8Z0EcUss9sQympKTbLPKGDOMVeR9yTBJ1W3LrmJx6CcQny
	jdpUUTvjLDNJ+cQ7T0gbU4RX+WvWwR+krwL10Z4VTCb4vxty+927giXG/q73Mu9sZSgc7/Zm/pEr5
	49wPKT0vlmq/wwYeiPN4eLO1IFEFIZfP7Ta7omWgPMeSqx+NGsTVwxqYTT2kSff8Y+HZpFxrOiyhw
	DT14birg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MzD-0000000Bygt-40xe;
	Wed, 11 Mar 2026 17:04:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myu-0000000ByIk-435R
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 17:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=R40MiDjdV1CjralqS3R+Tb9SfFYBiqy6S1/fcSy9W5g=; b=N7k6FaOITVd80Q6M7NuvT+jvwr
	9kFe8MR35Dyowgmz0fDes/+upg4/0d7iWAf+IEzOtLcUZqTrHfglWA+FOkgNou+uDzXZ5urJy7idY
	TwrfKMVe5Iddzm6N5WvNLbwClWmqhU1o/biK2F8Dd/sy31eaQrhyhE/NH/atBaeiq/ud2j+sHXWiH
	DE1NfV2YoQufT/UghKyoHav5kRxrp9gHhNiLxqhxgqoEdfUeJz4yp8ZsBirqLi88BRo5F92cA+f+3
	kZibctjiDiscegJBBXbna9N4c4EFGIpWos/XdSTIa70I/M6iTmGkIJbkAAIXFXxag2GD57r2EHA74
	FUe65HGA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myr-0000000HMvU-1xoa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 17:04:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFuxQe914642
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 17:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R40MiDjdV1CjralqS3R+Tb9SfFYBiqy6S1/fcSy9W5g=; b=hoLntPZOBS9bcwHr
	k9foIci7aGgNxsulbNLJYt1reqphiNJsMeOn6X7YdJZyHtF+iogW/HqyGL0XwJxc
	5Lr808XNNoxKAqkxcRxXYqHqok73xwTb2J/z1u65fwV2IZG1ibyLCT1dIXUskdoN
	SqezkY/OdszD4JAjSDjkY7jWNXfGzSy245gViKNo1A9PMZyaGhLbzw8bB2pQnKv8
	BdRrot4zTYf+Fwpls/GAiaPeaZEyJj1MFo0cB43cH+ZOp5XJZ0XQTeOA7pyWF4lH
	IuGWvsenCL/o/hblS5O3tdG3TVhB0ab9bKAj94iQAZJduK33z7A0cr4sk/PdkYmT
	g+dLhw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubg208vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 17:04:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50900e9803aso6275561cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248659; x=1773853459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R40MiDjdV1CjralqS3R+Tb9SfFYBiqy6S1/fcSy9W5g=;
        b=j4emPeaJmuHcaf4g7pc/CmzUUzxI6WAanyhxU4wTr+A6gA5YR87DkBvkWo4mfDt6TA
         6H2aVNeui6l332dnCrtG32L31eHwxS00rI9TQ0uTK9IzxSVYrZBXM1qLCLJSY+H6OWpW
         dvih4RhLL+pyz4mpThaYMTTcGkNG2t2ZnApOMAHxwbW2FVYViCMLI+fBF/EALrJLsab2
         ATUekStWn6FA+RaAYnG6xVBPAe3pEUJHEI4ffRhIl1nzWLeE69Og0yDoLGVUEsLIZyyF
         9MyNuH8uh0dX5eweP9cy85Xf2uvpGeFij9hX1t3MJuknHhsvMdxVPV+zLvSk4iOfLO5O
         YXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248659; x=1773853459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R40MiDjdV1CjralqS3R+Tb9SfFYBiqy6S1/fcSy9W5g=;
        b=qT0KZrX/qC/X9brS8jYXiNO7T8SiodvxSkr7DpuFo7qXWDATkObTcz3N9nC7eMT/4w
         rmxmpkpDOsAxfqCBDL5Mgz/YqtFwj22FYUcqbk0v53FS5F0ID/7kdAq2gZLY3+399Yfq
         kFm6phwAIljMcaNUt14xth+XpvimSHQmcl56UymjAttzs3PMXT6FBD2It+qUz0RFvZDz
         uK1QxZf7sh5ldeq0VjsMMaby0UE2KqEnDb/0tE1ASiS5tRypPLCs69tgH4VmEQQD3DZn
         1FA0keMJm8NRIZ8upOrAD1c1I6CFOXr7/SKQxLvdXBbjvt8O1dgOt6yjjfigq7vyanU1
         00oQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7KdTdYg6qvJ+YmK0/rRSZB8yz5R0I0ddX0cGpXa8jcdjjwVkArXtRnqwDygkknVhG+xPTEsYEkcvL3wxuixk0@lists.infradead.org
X-Gm-Message-State: AOJu0YywsiCiefWMewdeclWosWuA86e49UsQKE5DWih+WjF1Skz/tkv0
	8YD6egRao/laPKPhK+UHewmAsLs2crolMXmtevoWVZrOIOBakuimSQAuUvEbBS3Rp8XXg9aw131
	bkv90UpTSXceK67+teUN789sDBBf0fOuMlHGjMBRbsj+dcV/MFEmZTGSJt/IUvO8ALKnKxbG5rV
	ohSg==
X-Gm-Gg: ATEYQzzsWBrca9q3UUq9kKOmtqGKdYJEK17rhEJXlOm+xPGwmppOV2Jy93lN44FJBcR
	hPlkAud6Yfvk1kDvWk4bVoDhIZ5m0hTjmxfuHFMTUfEuTOimv7eTuBMdDBtgLG6SsLjaPkcgNnF
	q82cRsMGN/rgYIbRBpobS8sgcU48y9icWvoFcfmOf8Wo+PuOZ1CtzNkIkIFxc7NcEb3KAdWvn9Z
	gZgsrZP+h16NMpgXYJj9faN3Z7chPhEq+yE3S/+1XAYN9hTE99q/8PmJS1IRk9nNUzJjld7SBc9
	buair+gkChPsfw2ldUVhLH7XSq5DjcQwzPPNBsnZVwm3rgWnG7xyTLfbzxWQFz3fCUsU8Scq0fo
	HhoaOuKWMD739pIaf3rhLVQlfSRHyLmIS4rNyxtGzY9UPz+7cGK26
X-Received: by 2002:ac8:5a56:0:b0:509:59c:5799 with SMTP id d75a77b69052e-5093a0da546mr42673131cf.21.1773248658699;
        Wed, 11 Mar 2026 10:04:18 -0700 (PDT)
X-Received: by 2002:ac8:5a56:0:b0:509:59c:5799 with SMTP id d75a77b69052e-5093a0da546mr42671551cf.21.1773248657657;
        Wed, 11 Mar 2026 10:04:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:41 +0100
Subject: [PATCH net-next v8 6/6] net: stmmac: qcom-ethqos: add support for
 sa8255p
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-qcom-sa8255p-emac-v8-6-58227bcf1018@oss.qualcomm.com>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
In-Reply-To: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13278;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Dugz3DUItY9s5TtOLN4+N2+97oyMNRJFB/OhZsdqxm8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB4lrNgA5UG3WkIB6MbKHcC/zSx6XuPxqGKJ
 ImN5k2h1bKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgeAAKCRAFnS7L/zaE
 w+//D/0UFdHYmAej3gokDGVsGaQVOXFugeX8XyU5qg9R2+lUa0lzgfkxUNCEtHAJJS03P01zy5i
 Qct8jBl0/9Qg37FHXkS/EO5cMDkYJgZNB4qOuysLw8rksmdsijsR/lzaEWK77imhRGmIAUjH1W3
 r4YALzcpQZteQioFIE2NIsxj0mRqfJ7uuWDO8Wxhni6cZoS7stoaCxsw+rFFXAkDD34f+k1FRN7
 wqHfFASNKXX3UIIMdKm36e5eHytw1CEzGRCiwbJ9u9Q+AsIgsqcKEfMV+37cJHQRiyPmXz6mwSC
 nmO5VFIJb7mN/R0asyeeERmxB0cRg0tGQl5Ngi6cCLf7Q+WBHHXRmcq1FGnyQZzbPQav2zpA9RL
 ca/rJIK1+uGdn8mRZ3G0YY/Z6iOhlntkvHPaIJgIQXSr38GCjPoix6/ayXHdmtvXwMBSlX1KGQT
 hivPD+FpAs5lOVhqI7zus/T4PeXNTSFtXeLT+sNk0JDC+oAHlwvOSJXjIWF9Hj2H50adGlwMb6S
 bS899yo7uSl1FnZ5FYaoG2Ar2HYTWyz4e/OBAg/JH09PBTEQEfC9fvjA8w+Onb6rBdckwuF7AO2
 wYUqQM83Iv4WTrWmgUwb5X2n6rI4A2SEUpmb61tSq7u7RMqVXFYRiLl/Z2JTVbyn0KRxK5wQEwJ
 v2XcX0t8906ldow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Htl72kTS c=1 sm=1 tr=0 ts=69b1a093 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=eSQ9y_BssGCL3sbXkzsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfXyW28OuadkPZx
 H1bJqIJ+8XVevPM/cY6+UdvEWVmRXUpuAFFTiW3F8wlxtDXraqCqSugmKLsSmKiSzF4+//weFj1
 PbhP2/6dB/38ekX1jNtKYU4LUTM0P4BMsrhrRaUXbexz3yWQp+L/j1TpakWZ2++az2bwIVpnRcb
 ADihZ/trXsR3MUbGGZkv9Ipwfe0nj82onPCRpAi/5p0jCUrxUxXQrF6Osxm+/fjiWIkXwvY+fkT
 D1qMggpL1wqoprVODlqOoG20mx5u/6NucI4K+y+F7QgG96ObQsqGy0zBGtoui9iMPpz8ex24bv5
 zgS1JM8ulUBQb4DLW4NBCQhBi+PaaGLYeqV8XfHojcnHtOqoAYKY6OUsYkynIRh/33hlP5pZb0Q
 oLb934Y5zj3CwiGO5gqSyncF3RFznjjKO/oWJJUk46X2D2EjJMQCIniEzZImFuHlfkC+WX5Ba2Y
 qDsQSJyTyG5k/JfFDoQ==
X-Proofpoint-ORIG-GUID: wXXRCoiLtzAU18xHUOQovSf9X1Hm7anZ
X-Proofpoint-GUID: wXXRCoiLtzAU18xHUOQovSf9X1Hm7anZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_170421_865178_C3037555 
X-CRM114-Status: GOOD (  23.13  )
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

Extend the driver to support a new model - sa8255p. Unlike the
previously supported variants, this one's power management is done in
the firmware using SCMI. This is modeled in linux using power domains so
add support for them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 301 ++++++++++++++++++---
 1 file changed, 262 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 7e3dc1df093a20eb766ebcb29738d9f4261145eb..c20f127f341c1b6793c408283353d60dde4dcb5e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,8 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_domain.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -81,6 +83,13 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+enum ethqos_pd_selector {
+	ETHQOS_PD_CORE = 0,
+	ETHQOS_PD_MDIO,
+	ETHQOS_PD_SERDES,
+	ETHQOS_NUM_PDS,
+};
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -98,6 +107,9 @@ struct ethqos_emac_driver_data {
 
 struct ethqos_emac_pm_data {
 	const char *link_clk_name;
+	bool use_domains;
+	struct dev_pm_domain_attach_data pd;
+	unsigned int clk_ptp_rate;
 };
 
 struct ethqos_emac_match_data {
@@ -110,13 +122,21 @@ struct ethqos_emac_pm_ctx {
 	struct phy *serdes_phy;
 };
 
+struct ethqos_emac_pd_ctx {
+	struct dev_pm_domain_list *pd_list;
+	int serdes_level;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void (*configure_func)(struct qcom_ethqos *ethqos,
 			       phy_interface_t interface, int speed);
 
-	struct ethqos_emac_pm_ctx pm;
+	union {
+		struct ethqos_emac_pm_ctx pm;
+		struct ethqos_emac_pd_ctx pd;
+	};
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -338,6 +358,25 @@ static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.pm_data = &emac_sa8775p_pm_data,
 };
 
+static const char * const emac_sa8255p_pd_names[] = {
+	"core", "mdio", "serdes"
+};
+
+static const struct ethqos_emac_pm_data emac_sa8255p_pm_data = {
+	.pd = {
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+		.pd_names = emac_sa8255p_pd_names,
+		.num_pd_names = ETHQOS_NUM_PDS,
+	},
+	.use_domains = true,
+	.clk_ptp_rate = 230400000,
+};
+
+static const struct ethqos_emac_match_data emac_sa8255p_data = {
+	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8255p_pm_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -406,6 +445,28 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+static int qcom_ethqos_domain_on(struct qcom_ethqos *ethqos,
+				 enum ethqos_pd_selector sel)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[sel];
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		dev_err(&ethqos->pdev->dev,
+			"Failed to enable the power domain for %s\n",
+			dev_name(dev));
+	return ret;
+}
+
+static void qcom_ethqos_domain_off(struct qcom_ethqos *ethqos,
+				   enum ethqos_pd_selector sel)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[sel];
+
+	pm_runtime_put_sync(dev);
+}
+
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -655,6 +716,20 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
+static void ethqos_configure_sgmii_pd(struct qcom_ethqos *ethqos,
+				      phy_interface_t interface, int speed)
+{
+	switch (speed) {
+	case SPEED_2500:
+	case SPEED_1000:
+	case SPEED_100:
+	case SPEED_10:
+		ethqos->pd.serdes_level = speed;
+	}
+
+	ethqos_configure_sgmii(ethqos, interface, speed);
+}
+
 static void ethqos_configure(struct qcom_ethqos *ethqos,
 			     phy_interface_t interface, int speed)
 {
@@ -710,6 +785,45 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	return ret;
 }
 
+static int ethqos_mac_finish_serdes_pd(struct net_device *ndev, void *priv,
+				       unsigned int mode,
+				       phy_interface_t interface)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+	int ret = 0;
+
+	qcom_ethqos_set_sgmii_loopback(ethqos, false);
+
+	if (interface == PHY_INTERFACE_MODE_SGMII ||
+	    interface == PHY_INTERFACE_MODE_2500BASEX)
+		ret = dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
+
+	return ret;
+}
+
+static int qcom_ethqos_pd_serdes_powerup(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+	int ret;
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+	if (ret < 0)
+		return ret;
+
+	return dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
+}
+
+static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+
+	dev_pm_opp_set_level(dev, 0);
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -741,6 +855,68 @@ static void ethqos_clks_disable(void *data)
 	ethqos_clks_config(data, false);
 }
 
+static void ethqos_disable_serdes(void *data)
+{
+	struct qcom_ethqos *ethqos = data;
+
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
+}
+
+static int ethqos_pd_clks_config(void *priv, bool enabled)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret = 0;
+
+	if (enabled) {
+		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
+		if (ret < 0) {
+			dev_err(&ethqos->pdev->dev,
+				"Failed to enable the MDIO power domain\n");
+			return ret;
+		}
+
+		ethqos_set_func_clk_en(ethqos);
+	} else {
+		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
+	}
+
+	return ret;
+}
+
+static int qcom_ethqos_pd_init(struct device *dev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret;
+
+	/*
+	 * Enable functional clock to prevent DMA reset after timeout due
+	 * to no PHY clock being enabled after the hardware block has been
+	 * power cycled. The actual configuration will be adjusted once
+	 * ethqos_fix_mac_speed() is called.
+	 */
+	ethqos_set_func_clk_en(ethqos);
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_CORE);
+	if (ret)
+		return ret;
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
+	if (ret) {
+		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void qcom_ethqos_pd_exit(struct device *dev, void *data)
+{
+	struct qcom_ethqos *ethqos = data;
+
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
+}
+
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
@@ -781,31 +957,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
 
 	ethqos->phy_mode = plat_dat->phy_interface;
-	switch (ethqos->phy_mode) {
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		ethqos->configure_func = ethqos_configure_rgmii;
-		break;
-	case PHY_INTERFACE_MODE_2500BASEX:
-	case PHY_INTERFACE_MODE_SGMII:
-		ethqos->configure_func = ethqos_configure_sgmii;
-		plat_dat->mac_finish = ethqos_mac_finish_serdes;
-		break;
-	default:
-		dev_err(dev, "Unsupported phy mode %s\n",
-			phy_modes(ethqos->phy_mode));
-		return -EINVAL;
-	}
-
 	ethqos->pdev = pdev;
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base))
@@ -823,35 +979,101 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->pm.link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
-				     "Failed to get link_clk\n");
+	if (pm_data && pm_data->use_domains) {
+		switch (ethqos->phy_mode) {
+		case PHY_INTERFACE_MODE_RGMII:
+		case PHY_INTERFACE_MODE_RGMII_ID:
+		case PHY_INTERFACE_MODE_RGMII_RXID:
+		case PHY_INTERFACE_MODE_RGMII_TXID:
+			ethqos->configure_func = ethqos_configure_rgmii;
+			break;
+		case PHY_INTERFACE_MODE_2500BASEX:
+		case PHY_INTERFACE_MODE_SGMII:
+			ethqos->configure_func = ethqos_configure_sgmii_pd;
+			plat_dat->mac_finish = ethqos_mac_finish_serdes_pd;
+			break;
+		default:
+			dev_err(dev, "Unsupported phy mode %s\n",
+				phy_modes(ethqos->phy_mode));
+			return -EINVAL;
+		}
 
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+		ret = devm_pm_domain_attach_list(dev, &pm_data->pd,
+						 &ethqos->pd.pd_list);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Failed to attach power domains\n");
+
+		plat_dat->clks_config = ethqos_pd_clks_config;
+		plat_dat->serdes_powerup = qcom_ethqos_pd_serdes_powerup;
+		plat_dat->serdes_powerdown = qcom_ethqos_pd_serdes_powerdown;
+		plat_dat->exit = qcom_ethqos_pd_exit;
+		plat_dat->init = qcom_ethqos_pd_init;
+		plat_dat->clk_ptp_rate = pm_data->clk_ptp_rate;
+
+		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to enable the serdes power domain\n");
+
+		ret = devm_add_action_or_reset(dev, ethqos_disable_serdes, ethqos);
+		if (ret)
+			return ret;
+	} else {
+		switch (ethqos->phy_mode) {
+		case PHY_INTERFACE_MODE_RGMII:
+		case PHY_INTERFACE_MODE_RGMII_ID:
+		case PHY_INTERFACE_MODE_RGMII_RXID:
+		case PHY_INTERFACE_MODE_RGMII_TXID:
+			ethqos->configure_func = ethqos_configure_rgmii;
+			break;
+		case PHY_INTERFACE_MODE_2500BASEX:
+		case PHY_INTERFACE_MODE_SGMII:
+			ethqos->configure_func = ethqos_configure_sgmii;
+			plat_dat->mac_finish = ethqos_mac_finish_serdes;
+			break;
+		default:
+			dev_err(dev, "Unsupported phy mode %s\n",
+				phy_modes(ethqos->phy_mode));
+			return -EINVAL;
+		}
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
-	if (ret)
-		return ret;
+		ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+		if (IS_ERR(ethqos->pm.link_clk))
+			return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
+					     "Failed to get link_clk\n");
+
+		ret = ethqos_clks_config(ethqos, true);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+		if (ret)
+			return ret;
+
+		ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+		if (IS_ERR(ethqos->pm.serdes_phy))
+			return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
+					     "Failed to get serdes phy\n");
 
-	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->pm.serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
-				     "Failed to get serdes phy\n");
+		ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
+				       SPEED_1000);
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
+		plat_dat->clks_config = ethqos_clks_config;
+		plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
+		plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
+
+		if (ethqos->pm.serdes_phy) {
+			plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
+			plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
+		}
+	}
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
-	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
-	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
@@ -877,6 +1099,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_sa8255p_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},

-- 
2.47.3


