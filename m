Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D68606A322
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vu5SRGOi;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7yWPNL5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IaitItav
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=; b=Vu5SRGOiAR3k1Y
	qoJ4m/9CCW3RAyt8KEkJ7zBf5s6LQsWnaFPpGSkVrON7B7JkmIprrWw7vKxoI8Z1M9t3DZn5NlDYD
	AeZpM2vf2jY8WgDMXzwJkBKP+wWdEaC1vEfJcQvG2Akj8K0V9BT5s0XuDESWl+D55ijVv1AI6lM0J
	V/9r8+jfPfqAZ0Z01x43PaCnw0nWVLZk7LJi1C6yBV43ciB5NQ00/YxnqM/E8m88V1T2iigUUKz/V
	BtVehqWrpvlOxEUevpPMJq9jxszrMH2bZKWCKWS40PviWt+K6de3jHwwexoSzl2RV1Cu/nHf+D0v2
	vVzWXW09tKlDiebwP9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM28N-00000006t8h-3ln6;
	Wed, 28 Oct 2026 11:47:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM28L-00000006t7Q-3dKX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:47:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeF66692287
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=; b=c7yWPNL5Vbl5HhwF
	Y9kLuiFzcg/+wthv122esAhjKD4S/YIOR/5NgwWKmWr3JcrQM0Ajx/yo1okU+mvr
	LhXx9Hr5Xu/eYhRyYOm9JDbrICGFnjsu6jF35KlFgWiYOm7ZDxC7n9jlwfsKWKb0
	DZnB0aTzTPURelKiYnZy/Y2iDio+ri0oZIttxcNZJCpJkMyABcmVn0cY6iT8ywqM
	AZbCr6XVBiuw8HWmKyYGX7KzcFvvfG9D9PsPK+mRGlFl70AnUxQybsLT6E+swIZo
	WQ8iKdHh8U7Qmoiei8i5l1raass2Hi1CB+T3zWQ+Q94YC/0CXhSZCQ3cSa5uIwKX
	AVl3eg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be291b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:47:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae62796dso9594835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188075; x=1793792875; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
        b=IaitItavUZyyEiScm2Ye9yeKjIGo67rFmQO+uY+veq1fEHRNCG6ycdUuwCV8z7y/46
         NHa5gx6l1pg+/WhjSm6WWZxBL5edF3wfyVj4DNfCdXD4pGFQYag+XSdbHCWvgGBP4lRU
         UJjmBNiUtXdQDVI9JOIzKehq7SUiZFOik87NeAV0V51ZGAXZAZ81pnTZExCrNxjrEVRb
         0Ayp01xlWtfo16804d6odbBMOlirJbWZj6+JlBbGRJ9mfdnneET7/EGIblYW4Z4HTlXY
         DdyMq68eCV2dPZYp1rQEfJWI13azmt7VnGfye2H5KLX5DHTPSEfn3t6Su3YNEtFEZm6P
         M7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188075; x=1793792875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
        b=Z5WgF6SclIBIaQPRQguvbIN6FiYDaK+u9aVUpqHdoznT4LAPBc+d0n1y6mhCjpHPr4
         gaEeIil5vXEKYLMlJoNh8eaAiye5oiT2b9TBcbmEOwi7hghu1oF5vR5pxJ1BBMsFGtsQ
         RDk5LU3pZEJHM8CH7NPqYhF9xnDhmUYu7dajyjyIMDdmSZvYOWtypOidh67L3rG39lr4
         KH+LavbiFRqwnwuIdL5sZCRETY4iSntCF6YxznJEXzvR3lIgCA0MtMd1jjtbn6qaSrMr
         5vJg2gOoIbusgdXHb2E7oBl9pFEG/tsKingFnDAF6GQN05tWV8ZnWkgyxJeZi3RGTCkO
         zhRg==
X-Forwarded-Encrypted: i=1; AKwUvBwXTPD01GhBQNDkaHt1F8OgUpZOdYbzPf9cwu3EJFj23K1n3mK4bgbtECoLh/TfofTy3D3mQ4CNNwlnqSR9Doz8@lists.infradead.org
X-Gm-Message-State: AFq9FYJqaCAFJ/SvKU4Dn0z1ixiTXFg0TOusp6Z3Qb4yeckyxUd97ffk
	xgV08HOeu5Nwk6YX828iVKRmvoyf4DUK9s1AAMjOBfn3WGGvCFA/eFDq0+UzB2h+zZxg2b3Lxbe
	hmssJCxHPls8h1nu8UJ6p4eqiHFTv7iQ1u8fgDZTExX1Yh/t81YzPXXYd+Bmj/J4aoxgxuWMqVQ
	XofA==
X-Gm-Gg: AYBFou2kfcAl2DOj2vVggmkEiPPSUwbdKRbPb3xT8bc1NHE3SfPW3lmy+erfBAMZdVJ
	/pwCpvWVWvv3DjyzpbZC41rEPWR1JY2FqU/nQJ6rhYIf7LIPfKduYQHDYAlmyjGY/bg66rHQh3J
	VWJjiLmhk+YAAkPXXTXWW/+CeS7sCkoih/9uu9pvh5xXtykrQ+l80NZC2uD30yF8npTOye8/5dM
	f0XjQbejj5YaO+nKcHT+S0NolEp0u7HkXzyEmk3GuwmoM5ZhoiJ26GeSEIitfpUI+71JwogarFJ
	K4if5iTrQ/sYSMIs65DujEv6smerWmwI7On6irR89WgEas8ISqpAsEB8IxjxVtpuXV34zZlNBgA
	wytl5JyQKAh8TmLbujt0AngfTDVNcqUBuaQxWmayR1HG2pXQy/SopBvduPgWa+NmPFsSWRwvbUi
	ocOVqRPehuv2vPdAMvtXzlukfX70YU
X-Received: by 2002:a17:902:fc48:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb0012894amr21577605ad.1.1793188075442;
        Wed, 28 Oct 2026 04:47:55 -0700 (PDT)
X-Received: by 2002:a17:902:fc48:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb0012894amr21577315ad.1.1793188074861;
        Wed, 28 Oct 2026 04:47:54 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:54 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:42 +0800
Subject: [PATCH v4 2/6] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188045; l=1777;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=nnENsS345tQgPHx3zmQ+K+zRXVP3ubluTbm6JNHyQSg=;
 b=h2ds47c2oQRKF1vNQUB/QrBIE9LXmZDGjjWF1lGMsTu3cB1/hg297KQ6IRBkgJXKaeVT7jVaw
 5SRqG1WLBWVCC5cujL3fHmxMtZq0KcEeT34zoARvsZTVwcieLZR8ydF
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: 1HARMhGLvHsh7X2zOuEas2-4BkLBYRWD
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1e0ec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=s3E7sL18FQBPR4dFS-QA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX+EWDoYSSISVI
 GQIs1YIx9CBvrx57HWfpgjiosHrjknuYV4JW4KfStafy/dfL4NfJqyRncmvhWPsHZip6dtcak5c
 DG0z6E517j+D7Y4m5Ok339RC9Z6jeUE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX7oHIZrp+1MtZ
 o1A2jwaf8Nkf2LNq1JorEBd2cEK8HTtT2bhexk95ScD4/td4pOhmS36EhYwT4p31qsuMKhkurs2
 1aOy6C+NWFdBNEV8yJPzFFJzotp5Vtv2j8VOzX/2d/HAQXbgu5tnXgE+Z+HUrqkFi250Ednyuzx
 USRBdSFUtYFV4ZczuqcpSMTyzmvlZWPHtvkUfy5jRuGcRKZZl11/M49J0a02Vi6LneL0cwJcy44
 1ixsHfdMGvcVVI5wivLFDLtrbh7C0R1zwqQojx0YAvW7tSwtlItCgjxQLpa5xA+wLi0sD1jemrC
 I3yELqysOCoqgBc89L9x5so5yJ58JrW5DucpbyNqf1rRA27/jy3nnl4FTj+Lm9BYGWDZznkGqUY
 rRfJZ+xjfxKxcq+t4XpTSVAjeLj9fzGUUn7AtiAJ+PTm1Mouvc04HgwtYmhPa7DQnB4nMyuhWQz
 Kvq4ze4lm0y5w1jMLfw==
X-Proofpoint-GUID: 1HARMhGLvHsh7X2zOuEas2-4BkLBYRWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_044758_030746_C555A5CD 
X-CRM114-Status: GOOD (  17.91  )
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

struct resource uses an inclusive end address, so the window size is
end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
which is one byte too small.

mapped_hwpage_sz is used by the register access bounds checks, which
have the form "offset + width > mapped_hwpage_sz". With the size one
byte too small, an access to the last register in the window is
incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.

Use resource_size() so the size is correct. The ">" bounds checks are
correct as-is once the size is accurate and are left unchanged.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 347a5a6d6a1d..0f984fcbcae9 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2508,7 +2508,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else if (msc->iface == MPAM_IFACE_PCC) {
 		u32 mpam_fb_msc_id;

-- 
2.34.1


