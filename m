Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29979C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=J8J/VxnYVsUIY5cvJTg1zY8RsM
	hZhUk3t0wUGDGi664ypJ55Npp2ToqWHN2vIVaaztOqbLFWScZRqnJgKEYnCVjHeJuZLeeuviSHYXr
	Aca9o7piGwakBpK5K/sKXedhm2wpy+XkDWzSMibxnZ+Yjn25cLJ+DlQW4Y3EfFyrgl8604JAX8+PO
	qAfgSsAeNLDKPKAhCj2YHCUfoWg3INiaoKzdAPTbaxCP4RxDREtSlWozgXP5VFUoBZ8fYxZ0HGG6W
	6BLZ0IBi9dEf6YkcwcBta9htJeKq3XMbD0RixEOUoi68PJtrSv7Zi9xpnE/tiwnasEH9VLmT//m5o
	cM9z5JZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4G-00000001ftX-30Er;
	Fri, 17 Jul 2026 08:37:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke48-00000001fns-2jQ7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=WtqLvFBsljAclL4AU4Fgz6mert
	crHLjZiVxJSJS0ZBZY9cfm0ZT/CYu/U6TlFCXvV5IPkkv9JK+yr/Gjn8z59cFG7jhjVxWwv0k18Fh
	jCUBdCfQCnDmmesiX6tvyfb6UW8ETQPTbo1AAR+iUJ2nDFXUpgukUffDequxCdlDlYrNLn5FwNDdD
	2Plx0GqXYpXvMEfc9WYPa6DQsXLvFZ1JBmCWyN8w1tN54fjJTG5knBEDE6KpYEnbjl+quRQIxazve
	em3yxKesS36HJjiG3/Yj3iYJCcboeoO/1uWO1qBrtIKYDLdmkoqjpvngclUd3HOI5oxPfD/f6BC/5
	APY+uhfg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wke45-0000000Eg4w-0fkI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cSP8851587
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=Jar3QkZ642Thg/ni
	2NYxT2TzIA++eGcOPp3LWns2k7/oz4CmfgDt/xTWYV5FPjuUD8/d4vxyJDvthc4M
	gbDo0BzPqMLeDnN6QirxE/2xa2obVBhu6RyRcyC/r1JZjCez2O2Z5MgwB3JaM5hw
	kMWQoZpNIa9M0JjBAj6LY3fyz2oMrylTQRmZloKSdenEldcn2yzOWNN7V3a3GpYD
	KpD7ONIkQOLEDdQjSEJuFnxhEskmcJYkprLfzf/SCLgivtF2aXprvQn884ubZplk
	ibT+P16I5hkm5Z3SgacXNswXr/WaLIldbKxZUdyjEfSd0sdZAyxYWiksn0Ij/DLK
	nG8wkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p8ejm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:36:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e6f602cso86487541cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277416; x=1784882216; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=e6Fz0aRbtg6MRi9XfQ0aUTsGrNPuOrTG+dgtwCxNQyTcyvzWl/Ev9xvWdthwCsyQYp
         gGAS3KU69bCGu96mS5qCpAjW2k/jyGxsxctFTGwAzMvxgcW+n0lC5fl3qE9IId2Vz6dX
         QLFgjz2VteYuoP75d5RzIxK9s0dKUIQ5c4Brd0o7H84MC8d2bL9YCADTRhNZwB6iUQZU
         YQRJM4dYmx1OSCja839ZF+oXlmEGX4mfi60YbWqpdMa+7r1UsBY+bRPP0xcl/oON8EbL
         UHqknuX40OQrnmT5DlWQbLTUnh+Lj31VupWTXvrfUheAAYaMW77rDLZVfjSNMX4L2vHz
         dLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277416; x=1784882216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=moS3y7An77XfTCDV5XHL6SUmy5gKNiZjokY1JWXjFqIMoywMafs8XJzRwGP+GWb9yt
         czvVU2CA5ux8AvMEcfwj0BcFXaFyrY/U7+KAXYRiCkkeOYWeSciPTcN6vqOuMhX9HXs9
         6y/izpG0H7PF16luEZ5L+Fiq2QRzQjkWRTn+SufzYh0AB6Jcg3sMirzeo6+btbhf6IFE
         1gWTWuBIt6p87gy00TDc3yGeO/50G7koMZJHF1s9nvjh/iMtubdZkFojJS+i8C5/8qqv
         VYQIEqN5hIAG4MEl63V6XwcvCiws4h5Wgua+ONWfKWt6T161pfTzQTDtJouDWahxbrzq
         UQmw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu2y3Zl73o+ZFHLumeyEw40KH85pd1+upSiS/dnCzIH1Jxy8C4MTVYMwh4h/tQR3ISyg6JPKAmbsq2yIx2tzLE@lists.infradead.org
X-Gm-Message-State: AOJu0YzbP4Lzh+vMkYCBVgLlKZ8WNw6wmRQ1eTkZcJnpL529s93TIaIa
	PczPRYyt0Dov4bUQztu8qfZsojTGDbiIcisAVcz0eO5VSLi2usr7jKAcJBrS4gyoaIddbLLUkZD
	Jjclz/JkSW9QL+hGnRXZB6xVolURUrJBCv6nZtpCIYu2BrqdD/lavlSMl79oWfdH66OQEUzbzXy
	hH7w==
X-Gm-Gg: AfdE7cnHQfF9E7e/sgCKPrKz3F/2dw4zLGHLg5U/WLWrtfwyrnznkW2dzaPwFigklkF
	E3n+C+A2EJC02cbH1jWT6ddZyVDWfzwn5GVt73izvTOyVe8Yo8cDKXEnVfmDnYyDVMQD1Jt8krG
	gWZcIYMeGtDQCdKaG69oazM0Dwvx3Hj/2Br/nEc85xBJceBaWPSXV0nQsYoTBbjnAnFCIq/BP0E
	PSg4j3XqacwHNVyZh7OdPZDSSZLWNQToxkOB3/4HVcOvROO06AYLDytNjrkr0yktVX3ZxMaYZah
	mN2HchvTVgKrFBReIGV2kcQGF5WQveMkPQY+SOfTunXjV1yge2KJjl4al2RcG9UHUKH3Rwv08UW
	qkbxZBkm0euYFM0bzhRyJ0kUOJMO+0g==
X-Received: by 2002:ac8:7dca:0:b0:51c:167a:a48f with SMTP id d75a77b69052e-5213fc5832emr13493941cf.64.1784277416315;
        Fri, 17 Jul 2026 01:36:56 -0700 (PDT)
X-Received: by 2002:ac8:7dca:0:b0:51c:167a:a48f with SMTP id d75a77b69052e-5213fc5832emr13493671cf.64.1784277415952;
        Fri, 17 Jul 2026 01:36:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:36:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:28 +0200
Subject: [PATCH v22 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-2-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemWN2S795vbkqcG4ij9ubJGy6SuJf50F4bC0
 66Pb4j22VCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnplgAKCRAFnS7L/zaE
 wwlZD/9W2iUVIF4KIbsenZB6fCtyq8ib4S/4/NNNBCMD2PAWlLahOYax8bse8uRXEz1ZknDBOiL
 iYjW3QFER/8p0U4ICp8muOjyORmpmsEDXiFd/yMhhIfCFR+jTBP/u3AAH7+yoqvcLKY9L/kDlyo
 wRs9iTwffQQxCN+HGOJCvJLo470e2fWfX98dW9P3GJLw76PO8KbkpYzfxcvx3ElEoluN9Z+vKLA
 ts8htozQxwhlFGVbCENUmySIcjgtMgFMMJtOO/pHd5OKQ35aAwbUMrUeTdp7TNRagDB3tbVXXWH
 A7Oo9PQ8YHO66ZAX/ARmyggobbu9YrjQTpyBAUjRG71jumBMZc+3Xp4yh+5LnXEN64gfo6wjyW8
 JJnVYc5lNNdjNKktdcWzqPyy5SscTarSXGcHlUJ+TJ96rfFWDCFRyt+we3KAOrqsI845PtBdS12
 5qnA3Jz3sADowcuWtuo5e15JNFOya2U9Isyyd3grMFJ9MGNVvTlKPrrh0pcOczeCXczEre2OEhj
 q25/4hhDlMoCbtdvM40W+na07KmOLF4TAPA8h2mTcGRuro/sEr3XbiRaJDgWDBhIQ26zVD6xZAg
 yJQYF22aJJ1qK8m04YAUjkWKcaPpO1w0PIqPyt8DpsPJL6KRtCKA7gxpO3/WABq3khr3YH6Uqal
 6jZpVQVr3Wnsb8w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: pMp8OCVIWl7EPZ7ez7n67DKKv8C_-sIX
X-Proofpoint-ORIG-GUID: pMp8OCVIWl7EPZ7ez7n67DKKv8C_-sIX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX9ReiKq0CTCle
 HFK5RsxYHLiwgZ6/CINrMC6LltCCM9h05RbuPqdlBy/2S79V3dVaKCJUzMyvB7l9pVPGBZxEGiV
 bgy+ouefp+4QIyDnavxTrkO/OfBwpjeuLQg5hy1EnwS44sJfN1jnKvFTEVQ1rMStUc0hW1f3tnu
 3kbOakbQXE5NX8q88ToFj21VpnR9x4J/fcTu9fdjd8VjV7ckC5Ourtdpo4PkERLERe4jCz2sBT3
 zSs3J4jRnQZamz9ANgXyEj7gvPbQwXoazcP0P4xFkDHLu09NhUytkqZ4ZYuvpUFzwUMLnW2STlL
 OqkKArBhZPBJvNU/y5FfAXXxikKyKUNDaSAEfAdu9gtVkp/fU3P932oevf4o8QrqDaD19gzqx56
 kGxhLyg6OG/1p1skW4JFUiplX/APn97+sl+y16rjVFrX3JBH1HwNYJSso2/+wraRA4sQH2aT4m3
 C9ozMX50rj7XwJaMPJA==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a59e9a8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX+9MNOru/fayN
 /blGuaBwQnuQuyD2WP7/2GG/HiH57VEEXT6s2QkNOlGE8yl2Q/vrVQxDHjH+/PR7ga293JBY0Ws
 LTvdp+OHIARbbDeHaU5rU35xnYYoDD4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_093701_627358_B5B985A3 
X-CRM114-Status: GOOD (  17.04  )
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

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f3a16f97e0d4b86c945c252d97f57..fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1332,8 +1332,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1366,7 +1365,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1385,6 +1384,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1401,6 +1402,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	free_irq(bdev->irq, bdev);
+
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
@@ -1409,8 +1412,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
-
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
 		tasklet_kill(&bdev->channels[i].vc.task);

-- 
2.47.3


